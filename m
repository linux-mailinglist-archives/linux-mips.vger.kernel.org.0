Return-Path: <linux-mips+bounces-15442-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XD7TGAyGR2pLaAAAu9opvQ
	(envelope-from <linux-mips+bounces-15442-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 11:51:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F84700D35
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 11:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TllbTe6x;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15442-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15442-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9043130143F5
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46099395D99;
	Fri,  3 Jul 2026 09:50:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B837BE7E;
	Fri,  3 Jul 2026 09:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072213; cv=none; b=lBYUpu7fVj34G7HeeUAFCVH+LQe3UlGvFxjCbt5cWS9JFbuugSbtEgSrjHeKb6NKjHM4lnJjfRoUBmlfkhaQ9mFmO8VD0TVzgXC2etgyXNS7Zf2NI6XtqhemYWrEoxlMzjymUYBsoiiXswMikx7BpS1SvgJVPmGgOF2YrgLLiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072213; c=relaxed/simple;
	bh=ufRecVSV+JE0qQD7isMLU8mIJw42cegMtl7sZKPT/zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW9h8Ptt3ziOyz7OIGL6Qq6Pb00JM+x2lzHCo91cTulvGKhsbA7ZR2aJmU8WAxhNIi+DCt841ky/V7Iqm2tElEewGj/t7e1k3cgr9Khk1Wi9CqpqxxOHfSttD6W+bjwK8fbwsd0es77Uydiu8gR8x8S25s8ZJWs6Ou3Hm19eNuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TllbTe6x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D57B1F000E9;
	Fri,  3 Jul 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072212;
	bh=6zbs2nl9od7I1T2ffBTn68VoP6XSrys9MBKuxIewGoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TllbTe6xsh/9Ddy7ZRigiW679DaqTkVAzIA/4I7zVp3f667uy7VNqPLGMvOF8HVYH
	 BtJLZWE5IulcJbo1LQCiSQtafvfFtzKfDi8Oqt2B/69baT+5Eq/0ZdlajUOM50OfkT
	 GXuPZU4E9I9739YbSzCIAaKD4rzrct8rGjtkLi0jmNstp4ceCQSmqj2eBC6Zwmweu5
	 jrjougxJLV64hUcCivoGh4eviLXNWB6UiT1At0H+RhZjwMBnHUfs+L/t9Jtlkc8fsR
	 yGm66EqO3gSObIKg5uCT2RnJ2gA7fjMgdS0CGBTUgDXwNi/mm+QPoaU8MyXDlc1QRh
	 JjPgIFmxgnNyA==
Date: Fri, 3 Jul 2026 11:50:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert
 to DT schema
Message-ID: <20260703-inscrutable-boobook-of-strength-e2f2c1@quoll>
References: <20260701171917.263050-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701171917.263050-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15442-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-mips@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7F84700D35

On Wed, Jul 01, 2026 at 10:49:17PM +0530, Udaya Kiran Challa wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,pic32-clock.h>
> +
> +    watchdog@1f800a00 {
> +        compatible = "microchip,pic32mzda-dmt";
> +        reg = <0x1f800a00 0x80>;
> +        clocks = <&rootclk PB7CLK>;
> +       };

Misaligned indentation, probably not worth sending new version. Maybe
could be fixed up when applying, but not that big deal:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


