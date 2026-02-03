Return-Path: <linux-mips+bounces-13099-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGxlJiaggWkoIAMAu9opvQ
	(envelope-from <linux-mips+bounces-13099-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 08:13:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D113D599D
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 08:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C6DF30727BB
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 07:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6F2392814;
	Tue,  3 Feb 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIcNqfzV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD53921FB
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770102712; cv=none; b=dFj9547if/0lZtDbsd3ycbTZ0SrVTZK5KfQFsGiPR+rCwIEv6al3F3juawYX2qIcsvROeInFpypdKO7hYTqBXVMXL1RJ043Y16ibrcD6W76z2P1WgjH79qi2NMf4djx1+/smyCDRn9ejE+R2kcGtBrVYlrSq0mgWpJ43g4avf9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770102712; c=relaxed/simple;
	bh=laxKU9J68gf27OQLttBPmhdre7vKwFUxi4A9w+JW/g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL9vO7CCIc/xkbbWsLiG7AhsNlwbInsLoIBd1jRNwzcH/QqIkBoI/7m7nAXl7Ra1NeFg+xWAyVVEKE4S860G9hXKa0Vi8V7zXan/GI8wZHnBleH+c2o8b72NPlhI8jCr+sKVGTG/aaKhGJVpxepi0gdGvfE+6khbgOZ3dFeeoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIcNqfzV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso39952545e9.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Feb 2026 23:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770102709; x=1770707509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJxsi+WPVk/1w8ji8tTkZVJlPpC/NYS1SaMvxGY4Ss8=;
        b=fIcNqfzV8izEYIylSm3FBBg78ArIbksTYJxxTfOflw0XqGVELe020/0rMYkGnfxd7C
         5+xlR1j9+f+L5uaHi6ZP4yzkB6J8x2/QrndIe4GRpb/RkefU5VE1j2ov2g1fVp+D4UQO
         rB/sKPX3jzSWnaE+EIY+xoDMAcb/wkgm8077NwUZzCXTCB/aPZOWFUNBygeBxQwpNTek
         u8bKYBZG1YbH/Kn8xtn7jh0zaTy+TA8lcor6nq4IyACN7rIihVovuoN7yPZiCnY1YBcK
         GDM63LQwf5gKORp7DvF95hdy+R4vhIlwhAS1Zs5OmubArX+nDIg8bW4W7ZLWAeojS1WG
         F0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770102709; x=1770707509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJxsi+WPVk/1w8ji8tTkZVJlPpC/NYS1SaMvxGY4Ss8=;
        b=TPwPQ7V0aFZWIqlxrHs9f2jY6WLOebHCWWQ/RXqRj3TD7PTALzeNweMQR5JyzuVDV3
         2VB3OeI6RoX8yMAyd0exEBIbv/Es9QfzcQpLeUjx1aywmiXqKMEWnh16wCU8BEdnMylZ
         1SLjVVuPHd20E2OJnLBUcN5i07Qz9aAzvb9BM2S47tPgheh21h/GtXT2vzHeSmkFL1qQ
         J3i+W7l5YeAt3Cap9CvU30tIuD1XZkRK43SSZaUqoej99sIhrucPySkLgHD2EiWeZSg2
         qzlafg1K+FdPiT4wkEl0XXjkEXfM/5ptdioEJUCyaaa6QPC+9OqDpcXBqsOleUaO6AfK
         WJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCX+6KA59M6AEw1j0fWLpNSJ1xnnLymb7VeERijhotLXVynxTM+g/fe8gHp7EWzMnfK/bC9Yc/mM+pHE@vger.kernel.org
X-Gm-Message-State: AOJu0YzwT0slu2qkIjtdjpiBrJLKeGci3VSrlsqW/gyPAQryYY/bEcJc
	Hsg9gcT+eGzvuiYNM8nP6A5YUF2oAxr/mfxIp9SUv/8eLlBvz5xKxjdp
X-Gm-Gg: AZuq6aLyGLnh6juBsZ36/sg6q9MDHBD5qxkh1XMzphUd7pqCMb0VcqO+Y2YaBaJbHQc
	ZSjReVNYb8cW64JGeaIlwL0OWQBrIlYSDJbIGbcMZDNgasmcZgHeJOIf0Da/9JRHYbVTfyMsy9s
	lF6FQ08JDfcxtEW6gXkJRbyh61oVx3iUS1Qif632NDJlR+4N63oswpPNcIgESY7ScY/EOS6G8C2
	Xhnt23DOdliNW56V1qqKGYQXiaf5a+JUvy19ockUNTQ5iEbJOX+xpba7RIZEvFmA6vUeC7RFsWE
	LmndyEX9nndByGLNBDb5nO9ttGPRhlx6Xaxqu8UDcNsu/LU1rlJ/s1fQPRXfVHQSFcxK9lYL7Tm
	usVvC7qipgzjtziwaI04K4/W4TMMY1x93BM8v1hTXt+XTkVjiBiAfNySBQcLK//tR1arULz7j98
	6QeUED+Mv7oEGOhCVcCyrsd0wOnMXcClqu5y7e1WJM2/9DMF7eVtc6+/WOl84fRQBXs7nL4+56q
	4wzy7Xv57GXKHmhY7T0F1ma0DHCkxZWFcAOru6iKSTs2fGR+L6Xcg==
X-Received: by 2002:a05:600c:4f8a:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-482db456350mr200139365e9.3.1770102708700;
        Mon, 02 Feb 2026 23:11:48 -0800 (PST)
Received: from ?IPV6:2003:ea:8f39:1b00:4513:6a36:9d8d:57a1? (p200300ea8f391b0045136a369d8d57a1.dip0.t-ipconnect.de. [2003:ea:8f39:1b00:4513:6a36:9d8d:57a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48305161534sm36648405e9.12.2026.02.02.23.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:11:47 -0800 (PST)
Message-ID: <61594c17-5afc-4b88-9384-892232523790@gmail.com>
Date: Tue, 3 Feb 2026 08:11:46 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next] net: lantiq_etop: remove driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 Daniel Golle <daniel@makrotopia.org>
References: <73f3ea5f-57ed-40b1-9acb-ab595083aab6@gmail.com>
 <20260202171357.0e4a9e38@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20260202171357.0e4a9e38@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-13099-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkallweit1@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D113D599D
X-Rspamd-Action: no action

On 2/3/2026 2:13 AM, Jakub Kicinski wrote:
> On Fri, 30 Jan 2026 17:40:49 +0100 Heiner Kallweit wrote:
>>  arch/mips/configs/xway_defconfig              |   1 -
>>  .../include/asm/mach-lantiq/lantiq_platform.h |  18 -
>>  drivers/net/ethernet/Kconfig                  |   6 -
>>  drivers/net/ethernet/Makefile                 |   1 -
>>  drivers/net/ethernet/lantiq_etop.c            | 745 ------------------
>>  5 files changed, 771 deletions(-)
>>  delete mode 100644 arch/mips/include/asm/mach-lantiq/lantiq_platform.h
>>  delete mode 100644 drivers/net/ethernet/lantiq_etop.c
> 
> Also Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml ?
> and arch/mips/boot/dts/lantiq/danube_easy50712.dts but that needs 
> to go via the MIPS tree

Right. The mainline version of lantiq_etop doesn't support OF,
support for OF and the compatible lantiq,etop-xway is added
only by downstream patches in OpenWRT.

