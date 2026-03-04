Return-Path: <linux-mips+bounces-13365-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HyCIhMCqGkpnQAAu9opvQ
	(envelope-from <linux-mips+bounces-13365-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:57:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C01FDF8C
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FCBC30162B8
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014FA39FCA1;
	Wed,  4 Mar 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="cx2wm9L8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61D39EF36;
	Wed,  4 Mar 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618247; cv=none; b=rB6VIIs/cjL+e3dN9wd21ZkQzP3zhlVkZ4V+H0J7Bp3+jz6Ufnb1qCJmIrkjetcEOnwBcmJ5qcChuRmecdag00zx8vgggEonyeHHfUo+IkMvSl927R8S7bo/e1bGxYJCdhf6+pYHtDyRdkez5tRi4K8/Oa90rVfN0MXz0QWVmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618247; c=relaxed/simple;
	bh=SxIIGd0XFskUYE+tdfvYw1xcFU7gZD98/qd+/d9UQZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5w/rr8HkUwrDdlHVn+F7yYOVN7QVFmMkwG12lxrbpefo0WVb1TIeNXzvyiVac2TyaDfnC/ZAlsR6TLyaCLNAt7ndaqCQeES+ZwFmt6CK9fOMlq3eK0Iq93PGdxN3PVDOvjBXrf4saA4JbL0FldiqK4s1/xBWc8WCqVzU3L8vYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=cx2wm9L8; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E31A22B11A;
	Wed,  4 Mar 2026 10:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772618241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o/J670QYTQ0TzMrMVCgmKTiKIwt4yiwKdlz7EPRMQYk=;
	b=cx2wm9L8Zb3EarEb1qJsmYPWTNlHFiJY+3jxeLhaegWPBpxQtY2wZC5W9rTt5H0/HOPauE
	+4Ys+WVETG2G7z/NSYQ/tEjReoXjeYpr3HdZHnJuh1uitABIvImydlAstEbZZyCyvWDlZo
	ejk/udhin38cNVansYiTXWX0lVhNLw1e6NQjTwlyAieqM8nbuQE2cmra9CdPdLI0gNycyv
	WXan80C5roE5RSdDw0qRiMt9vWE44HgMtK67iBe8Uzzuod79p3Fts5fsNQ1wem3zjuz5mf
	3yw4sGrcaRPwPLUL7LDZa1S3KZBc7wyHjkJp3dm9DIh6XO1uCOpvSOSWOpM0fQ==
Message-ID: <4806aee5-d324-4d62-a4e7-683a448a2623@cjdns.fr>
Date: Wed, 4 Mar 2026 10:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221
 bindings
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
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-2-cjd@cjdns.fr>
 <20260304-accomplished-helpful-orca-5d6b81@quoll>
 <7888e449-fec9-4a23-8133-ad0c9651a354@cjdns.fr>
 <419c552a-a57f-4f67-9923-5315ea43a4d9@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <419c552a-a57f-4f67-9923-5315ea43a4d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 304C01FDF8C
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
	TAGGED_FROM(0.00)[bounces-13365-lists,linux-mips=lfdr.de];
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


On 04/03/2026 10:46, Krzysztof Kozlowski wrote:
> On 04/03/2026 10:09, Caleb James DeLisle wrote:
>>>> +
>>>> +description:
>>>> +  The EcoNet chip-scu block provides a configuration interface for clock,
>>>> +  io-muxing and other functionalities used by multiple controllers (e.g. clock,
>>>> +  pinctrl, ecc) on EN751221 SoC.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: econet,en751221-chip-scu
>>>> +      - const: syscon
>>> And it does not fit existing syscon bindings file, because ... ?
>>
>> If you're asking why it needs to be named "econet,en751221-chip-scu" and
> No, I am asking why you cannot put it with other syscon bindings - git
> grep syscon? What is missing here (we expect complete binding for given
> hardware)?

Ahh so mfd/bindings/syscon.yaml, that looks fine to me. Two reasons I 
didn't do that: 1. didn't know it existed, 2. Assumed 
arm/airoha,en7581-chip-scu.yaml was done The Best Way Possible. I'll be 
happy to re-send using syscon.yaml

Thanks,

Caleb

>
>
> Best regards,
> Krzysztof

