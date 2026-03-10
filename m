Return-Path: <linux-mips+bounces-13448-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDbKLaP0r2nkdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13448-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 11:38:27 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B42497B7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 11:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48CE301DC30
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB9F370D4F;
	Tue, 10 Mar 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Ad7zddx8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522E3290C0;
	Tue, 10 Mar 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139055; cv=none; b=L1aG3QdtaY21go234nkv6BomM8yQ6EMRTG/Nxnyg8u232UBFeHtHOa2FuGL28SPc/vL0knM6GK8WjBSi0aqqf5W3ZREBu1V93wwxfHjmS3yyD7wwaVARVEVhlZXFrAjzISH+UB+Ms2e2njfjMpJAsCgNuCokTKRfpGUY5pDQMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139055; c=relaxed/simple;
	bh=IM3vochcg7NYCrqAYrIjjYRtsA6SOjo+Yu29N2Tzjw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjW3y22lR0zjQHSLJsf9yCpf7g22vL8M2/ZIwtKpIA2lKI1Gm8Z3exyCfA9hfeybIIPToakidKso2QVfyBPpubqROshD8HWe6L6KheCCjVpIveJlMQK209CNNA+LTZYIfQ3RUwSdqNR9/AZAdUg/mD8SDIqoXIEbLKH2Y1M9Rjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Ad7zddx8; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1E2D28EE37;
	Tue, 10 Mar 2026 11:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773139050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jHawHue/HHoIMdOylZQNB/N2WuX1uZGGBcXmmXhdZ6Q=;
	b=Ad7zddx8oLtstjGz5KASb6EIQGTzoZs9lk+j6pG7a0EA2N4rQpTuEP/dPCcVzlag/LRZmu
	A81x245jxiYDnd5BMETB4uihbQnNA7byLOz7LruvohZlV/sNgt1BnsyR0wJiCRLK48B63M
	gagBE0XLsr4ZbDD8AF0PvSXE/QSv+xEMMV608qhIzaFzoVIdQolWDUmN1+9NtEPf8O1Pyx
	xZcZf+m3VNtkOThDFb2EuxSNqPbznlw1h2JWdyN8vSP1NdYYgIBXce9F97j7LVneL1fTfv
	Ba5bkpXm9uRLbjKmPKvQXQpF91TvVk8rjDBQJBgYsVxamlUen4GS0++ZGkdZEA==
Message-ID: <1611d3d5-8c3b-4298-bf50-55ab2c2db0e7@cjdns.fr>
Date: Tue, 10 Mar 2026 11:37:23 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-4-cjd@cjdns.fr>
 <20260310-scrupulous-fat-ara-eab47c@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260310-scrupulous-fat-ara-eab47c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 5F9B42497B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13448-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action


On 10/03/2026 09:24, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
>> which behaves slightly differently because one slot is Gen1/Gen2 while
>> the other is Gen1 only.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Still, four separate subsystems unnecessarily merged into one patchset.
> Split independent parts of your work per subsystem. See also submitting
> patches.


I asked for clarification last time and didn't get a reply. I'm not 
against changing it but need to understand exactly what's expected b/c 
the way I'm imagining it seems way worse. submitting-patches.rst only 
says of patch sets "only post say 15 or so at a time", obviously not the 
case here.

If you're asking for one patchset for phy, one for clock, one for PCI, 
and then one to introduce them to the device, I can do that. I just want 
to be sure because introducing unused code, and patch sets that depend 
on other patch sets both seem like anti-patterns to me.


Thanks,

Caleb


>> ---
>>   .../phy/econet,en751221-pcie-phy.yaml         | 50 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 56 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>

