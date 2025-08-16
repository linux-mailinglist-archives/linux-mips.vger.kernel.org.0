Return-Path: <linux-mips+bounces-10341-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BBB28D86
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 14:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3CCA26667
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 12:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD88E229B18;
	Sat, 16 Aug 2025 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="wdm6kXYE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0724521D583
	for <linux-mips@vger.kernel.org>; Sat, 16 Aug 2025 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755345859; cv=none; b=bsPRwMyWmv7mm/RkmXt6m3bzYZB6e7KdvRFj6ZIqzFOoAU1C3xvm0Pf42q5j4CD1/ht2q0C83orANaP3C3sp9c/9QvJMfYlZxi2DOgIL4jMzNwn8xSk1bbnxWwOQmU8D1wYklUPB9qedXgmgVoFSt9eorr3asVq7V8uwUQ4IFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755345859; c=relaxed/simple;
	bh=t63xP7wbz/CsoRt+s5ClY7ekzXig2IH8x/MbkPBlbvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juk6F3j5tunsNYxYI6UVYD+4wrRva8a0mIG0Ce4Wvhi23z2KSuv1rX4LB0dlOL644VlUfVAg0PR7qqEu487vhYDzwGdsxixP2k9VfW/3ZuAfPSvLiluRT85JCpQZcy2esTlSIoLGmi8f27DwiW9Zsx4SxkLTn72RmUbK32i8n1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=wdm6kXYE; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 20827 invoked from network); 16 Aug 2025 14:04:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755345849; bh=J8YEjh/pQ9i8Wl0STZLqAHRZnuedkvdfjwXqtEq3kkw=;
          h=Subject:To:Cc:From;
          b=wdm6kXYE/zrr3wa02A83E2fuu5y2rXWgR8BQIX9BXEFYmr3rbmBooQlCsxRVUUmsR
           2Bk9io3SM89+6BUOY5slRNY9NKy2F6UrA6UuLQgpqemuVcXpYvOAZRdZ4F1kqC213a
           RLdlgW7sK37n/SXTzA/SU+Iw5KqOZgC6srGK2i1S73eKasofeIpPz3HxST4yQ1vKdc
           h/IYcJbaLYLFimS23BDtuMRC6DyvmE8/wXhH/6jAZe/A2WKCRg/QwLPMieNt5bd4Gv
           K2X0mm9RH8YBCpeHkO+qNezx5p96lEVrWrYUoIe+ptt4tmR9to8vq5WkMMuUGPaL3E
           tz1U0or1ze8kQ==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO [192.168.3.229]) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <conor@kernel.org>; 16 Aug 2025 14:04:09 +0200
Message-ID: <0dc6c3b2-cf93-4cdf-b0bb-1b0d420f1060@wp.pl>
Date: Sat, 16 Aug 2025 14:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
To: Conor Dooley <conor@kernel.org>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814093704.3197030-1-olek2@wp.pl>
 <20250814-settling-hamstring-d6a6e957f6c6@spud>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250814-settling-hamstring-d6a6e957f6c6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 9cbe2bc5c69b60e7ad18a5b9179db56a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [ETOR]                               


On 8/14/25 22:50, Conor Dooley wrote:
> On Thu, Aug 14, 2025 at 11:36:59AM +0200, Aleksander Jan Bajkowski wrote:
>> The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>>   .../mips/lantiq/lantiq,gptu-xway.yaml         | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
>> new file mode 100644
>> index 000000000000..fcfc634dd391
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
> "SoC series" implies that you're using the same compatible for multiple
> devices. Why are you not using device-specific compatibles?

This IP Core didn't change in subsequent generations of SoCs, so it had
one compatible string. In the next iteration, I will add device-specific
compatibles.

