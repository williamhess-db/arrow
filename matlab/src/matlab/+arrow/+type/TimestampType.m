% Licensed to the Apache Software Foundation (ASF) under one or more
% contributor license agreements.  See the NOTICE file distributed with
% this work for additional information regarding copyright ownership.
% The ASF licenses this file to you under the Apache License, Version
% 2.0 (the "License"); you may not use this file except in compliance
% with the License.  You may obtain a copy of the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
% implied.  See the License for the specific language governing
% permissions and limitations under the License.

classdef TimestampType < arrow.type.FixedWidthType
%TIMESTAMPTYPE Type class for timestamp data.

    properties(Dependent, SetAccess=private, GetAccess=public)
        TimeZone
        TimeUnit
    end

    methods
        function obj = TimestampType(opts)
        %TIMESTAMPTYPE Construct an instance of this class
            arguments
                opts.TimeUnit(1, 1) arrow.type.TimeUnit = arrow.type.TimeUnit.Microsecond
                opts.TimeZone(1, 1) string {mustBeNonmissing} = "" 
            end
            args = struct(TimeUnit=string(opts.TimeUnit), TimeZone=opts.TimeZone);
            obj@arrow.type.FixedWidthType("Name", "arrow.type.proxy.TimestampType", "ConstructorArguments", {args});
        end

        function unit = get.TimeUnit(obj)
            val = obj.Proxy.timeUnit();
            unit = arrow.type.TimeUnit(val);
        end

        function tz = get.TimeZone(obj)
            tz = obj.Proxy.timeZone();
        end
    end
end

