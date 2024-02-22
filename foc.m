function [data_out, fo] = foc(data_in, parameters_foc)
% FOC Frequency Offset Compensation

N = size(data_in, 1);
Rs = parameters_foc.Rs;
Ts = 1/Rs;
TimeVector = (0 : Ts : Ts*(N-1)).';
distance = parameters_foc.distance;

data_p4 = data_in.^4;
data_p4 = conj(data_p4(1:end-distance,:)) .* data_p4(1+distance:end,:);
data_p4 = sum(data_p4);
fo = 1/(4*distance*Ts) * angle(data_p4);
fo = mean(fo,2);

data_out = data_in .* exp(-1i*fo .* repmat(TimeVector,1,2));
