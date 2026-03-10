Return-Path: <linux-mips+bounces-13452-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIFVGQH9r2mmdwIAu9opvQ
	(envelope-from <linux-mips+bounces-13452-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 12:14:09 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872C24A2E7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 12:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE158303676E
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 11:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E6E3876D7;
	Tue, 10 Mar 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="FhYD7Fkx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13B03859DC;
	Tue, 10 Mar 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141219; cv=none; b=OkrybxwltxCNvGPuQp+mzmaM/lxKUTLvU2ndXJEMDtvyZI6b8Lx1B3vg0bTRCSLzfxO/as+MWMHxddap7RIctsjrSLMTXDck3ezhiQ3U3k13mFOiPwZQ2FjZH4ugEyGCmtGSFSaEVM2w9majd0PZ3XJhJlljlKkA5G1mJQrWh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141219; c=relaxed/simple;
	bh=1iPvQ29yv1IijT8IDMtsV7wpjXPY794bQYVjkw4uRYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Di2L87X3TYHy+qEjPCIxE3ZBc7M6EDG7P6cqJm202xjK/VXJ6jRa08wmecZjq0aAenRbtRcrhZ45o9uMWt844yqfYE074sQBWXLKMKxDj1TAI8xJGwJp2RV1HSaZWGRcUQm0JH6YnGb9aT8ON5eK4cVI+/E6KNYXD4gr+I90CkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=FhYD7Fkx; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4C08294E29;
	Tue, 10 Mar 2026 12:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773141212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ppjb9j47yslvcid+DX8q6bFEIbk65jKNXP8aELcAr9o=;
	b=FhYD7FkxVdjaKA9J/WpxISceZjzTFPOD/2RXU5lPSgSvOIDYQJGkBo2m8dN3kQxuwPb0+4
	drLFzl+7KYPS4ilJainCA8MI3Kkp8uGJYqtQsjUbca4kCALBXeyW0cxlKia1z+yvz0NF1X
	bZ4Y770R8Q3E91oPiwDkfVRYummRq1X4tl5oMbGAq4nihPmBwCHlZL+gyljm7JmHy2zwgi
	mlWP6e6t1ZViR0DlaugoRmNG4TcqMyVeJzAnmFYpeMJ9NKrI0aPd6s0muisTzp3cIwMR+/
	r0EatcYhb8hH72h4TsjUpF1RWZjzD1miUUFocbTgi3plasjxeyNsr2nAGxVDeA==
Message-ID: <36710cc5-5a80-49fc-a9e8-0cac5c554ed2@cjdns.fr>
Date: Tue, 10 Mar 2026 12:13:26 +0100
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
 <1611d3d5-8c3b-4298-bf50-55ab2c2db0e7@cjdns.fr>
 <05b0fc76-4cdb-4aff-815c-1aad500837b2@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <05b0fc76-4cdb-4aff-815c-1aad500837b2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 0872C24A2E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13452-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On 10/03/2026 11:40, Krzysztof Kozlowski wrote:
> On 10/03/2026 11:37, Caleb James DeLisle wrote:
>> On 10/03/2026 09:24, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
>>>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
>>>> which behaves slightly differently because one slot is Gen1/Gen2 while
>>>> the other is Gen1 only.
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> Still, four separate subsystems unnecessarily merged into one patchset.
>>> Split independent parts of your work per subsystem. See also submitting
>>> patches.
>>
>> I asked for clarification last time and didn't get a reply. I'm not
>> against changing it but need to understand exactly what's expected b/c
>> the way I'm imagining it seems way worse. submitting-patches.rst only
>> says of patch sets "only post say 15 or so at a time", obviously not the
>> case here.
>>
>> If you're asking for one patchset for phy, one for clock, one for PCI,
>> and then one to introduce them to the device, I can do that. I just want
>> to be sure because introducing unused code, and patch sets that depend
> What is "unused" code? Or how is it unused? Do you understand this will
> go via different subsystems and nothing will be "used" anyway?


Unused in the sense that you can't exercise that code without additional 
code which is out of tree - at least until the subsequent patch set lands.

>> on other patch sets both seem like anti-patterns to me.
> And asking four different maintainers to manually pick up individual
> bits with multiple commands, instead of just applying entire set
> targeting their subsystem, is pro-pattern here? No. Why adding more work
> to maintainers?
>
> Think how this is seen by individual subsystem maintainers and how they
> should handle it.


Okay I think I see the goal, thank you. And you know I'm not smart 
enough to have an actual opinion on this, I just needed to understand 
the "why" so that I can do what's expected w/o goofing it up.


Thanks,

Caleb


>
>
>
> Best regards,
> Krzysztof
>

