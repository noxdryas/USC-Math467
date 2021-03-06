%dHval.m
%MATH467 Final Project
%computes the numeric value of the derivation of H(Z)
function dHv = dHval(Z_0)
%% Initialize

a = .97561;
b = .04878;
q = 4;
r = 2;

Q = zeros(200,200);
[Q(1:100,1:100)] = q*eye(100);
[Q(101:200,101:200)] = r*eye(100);

%Assemble A in parts
A_left = eye(100);
for i = 1:99
    A_left(i+1,i) = -a;
end
A_right = eye(100)*-b;
A = horzcat(A_left,A_right);

B = zeros(100,1);
B(1) = a*.15;

syms u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20...
    u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38...
    u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56...
    u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74...
    u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92...
    u93 u94 u95 u96 u97 u98 u99 u100;
U = [u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19,...
    u20, u21, u22, u23, u24, u25, u26, u27, u28, u29, u30, u31, u32, u33, u34,...
    u35, u36, u37, u38, u39, u40, u41, u42, u43, u44, u45, u46, u47, u48, u49,...
    u50, u51, u52, u53, u54, u55, u56, u57, u58, u59, u60, u61, u62, u63, u64,...
    u65, u66, u67, u68, u69, u70, u71, u72, u73, u74, u75, u76, u77, u78, u79,...
    u80, u81, u82, u83, u84, u85, u86, u87, u88, u89, u90, u91, u92, u93, u94,...
    u95, u96, u97, u98, u99, u100];
U = U(:);
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20...
    x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38...
    x39 x40 x41 x42 x43 x44 x45 x46 x47 x48 x49 x50 x51 x52 x53 x54 x55 x56...
    x57 x58 x59 x60 x61 x62 x63 x64 x65 x66 x67 x68 x69 x70 x71 x72 x73 x74...
    x75 x76 x77 x78 x79 x80 x81 x82 x83 x84 x85 x86 x87 x88 x89 x90 x91 x92...
    x93 x94 x95 x96 x97 x98 x99 x100

X = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,...
    x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34,...
    x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49,...
    x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, x61, x62, x63, x64,...
    x65, x66, x67, x68, x69, x70, x71, x72, x73, x74, x75, x76, x77, x78, x79,...
    x80, x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, x91, x92, x93, x94,...
    x95, x96, x97, x98, x99, x100];

X = X(:);

Z = vertcat(X,U);


%% Write H as a function of Z
H_Z = A*Z-B;


%% DH_Z

dH_Z = jacobian(H_Z,Z);
dHv = subs(dH_Z, Z, Z_0);
dHv = double(dHv);
%first, solve for Z(U)
% Z(1) = a*(.15)+b*U(1);
% for i = 2:100
%     Z(i) = a*Z(i-1)+b*U(i);
% end
% Z = Z(:);

%Z_vec = vertcat(Z,U); vertcat does not work with syms
% Z_vec(1:100) = Z;
% Z_vec(101:200) = U;
% Z_vec = Z_vec(:);
%now, H(U) = Az - b

% H_U = A*Z_vec - B;
% dH_U = jacobian(H_U,U);
% dHv = subs(dH_U, U, U_0);
