function y = custom_conv(x, h)
    n = length(x) + length(h) - 1;
    y = zeros(1, n);
    for i = 1:n
        start_idx = max(i - length(h), 1);
        end_idx = min(i, length(x));
        section = x(start_idx:end_idx);
        y(i) = sum(section .* fliplr(h(1:end_idx-start_idx+1)));
    end
end