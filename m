Return-Path: <linux-mips+bounces-10324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469CB27E0F
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 12:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBB23B63ADA
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 10:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965EB1917E3;
	Fri, 15 Aug 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="DR1Uc4N0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E122FD7B5
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252832; cv=none; b=Tc0fouZeTJ8rEGuNe+JFWqZJYlUNaSmmQhw97ExTpAFF76c3YPjSXV2ZUgiQXWhYFAQZ8E0ahvZYniZxwj0Kh0pp39VM0cuAfuIqycVMaTek2io73XROntLQ5llhhYKMbdNR+Yo/pIQkHagh9MOTPgWMIpD6ATASWGhiAwZSsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252832; c=relaxed/simple;
	bh=VRc3rQ7+La7aIkyerSr7PwkoKxI1T0FHfNo7SL3je3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fY3ft90R8NSbUbZ/vZ1XLATM4bxb76sVxAOqMyCm8CXa/40FEwJ3MZa7MV+/77W7RSGeOiiQB+Mj4U3YNLW4ZNsYsq/ITmjxkt6Z6tyDFtfXMJIBsHnir9vgP2yQ06DXLHAdq2Uka73YaWYeV8DqGbokOP9B+LWyUdooOhGuBmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=DR1Uc4N0; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 5539 invoked from network); 15 Aug 2025 12:13:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755252821; bh=6r56aWOWGPsFTWKVJBoTW8tov6K5rxxKHvtf2/SRI2s=;
          h=Subject:To:Cc:From;
          b=DR1Uc4N0PXwAmbcc2WRaNUAfOZYD9W2PvpHq8HOtkQ6Cka1EJEtmbDAhT7532f+ok
           vUeeNR6oyxoa78p8Y33w5d96f4gLL4NiuLgLSHLJKhuTiubieIS8rS2gcgYhL2VpLq
           ruBE16OZ6SnTzGwLSh7fY0ytPPLSCRap7NnVLI8JbBXvoLrCTfBEK7VZ7nZlvAAitS
           9l3/kFqRyRzDrOtwYfQOfWIY8iNo6sgazD5LM7z8iHtUHLewGE+nqULe3ebfHxEhJ2
           jU40h+f1pgfvwer4pLmaJSlwl6zHHsLOrDhONElaWYecdOX4rCS7HVJi1zt7TwMk1r
           yRcM1m+NhCUDw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO [192.168.3.229]) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <conor@kernel.org>; 15 Aug 2025 12:13:41 +0200
Message-ID: <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>
Date: Fri, 15 Aug 2025 12:13:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
To: Conor Dooley <conor@kernel.org>, y@spud.smtp.subspace.kernel.org
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814082705.3183231-1-olek2@wp.pl>
 <20250814-vocation-viscous-b54bc343e8c6@spud>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250814-vocation-viscous-b54bc343e8c6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: d35a1fff0ca298d56e43c5fe00b3bfb7
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YTOB]                               

Hi Conor,

On 8/14/25 22:48, Conor Dooley wrote:
> On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski wrote:
>> Lantiq DCDC is a voltage converter with a voltage sensor.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>>   .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>> new file mode 100644
>> index 000000000000..5648b9676b3c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Lantiq DCDC (DC-DC converter with voltage sensor)
>> +
>> +maintainers:
>> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - lantiq,dcdc-xrx200
> What is "xrx2000" in this context?


“xrx200” is one of the generations of Lantiq SoCs. It includes four part 
numbers
with the same memory map. The other generations are amazon-se, danube, 
ARX100,
GRX100, xRX200, xRX300, xRX330. These correspond to the internal code 
names: ase,
danube, ar9, gr9, vr9, ar10, grx390.


Best regards,
Aleksander

