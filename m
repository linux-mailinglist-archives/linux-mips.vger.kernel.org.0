Return-Path: <linux-mips+bounces-13643-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNl6Li93tml4CAEAu9opvQ
	(envelope-from <linux-mips+bounces-13643-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 10:09:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8B2904F5
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 10:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B600302E43D
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E602641E3;
	Sun, 15 Mar 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYvX51nt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFB14F9FB;
	Sun, 15 Mar 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773565740; cv=none; b=ZhSNUYAPChizqKoNoRF4N4/aZZvDy1dv4pt7LUx/pvgR2w4gZlacIz8tnfwFP/FOUnZsL7zWlFEB4r7gdnLTFoeu3lpns7Gj44wObSo32n//9X1m5Byb1D3RLc61ah2dTe0hAZgAhbItESFZ3iWNfSd8QynFZ+I3DDwmAypaLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773565740; c=relaxed/simple;
	bh=HjYvoB4f85qvsndu8SOgOTKaSMRZRps5PYp2U6ltbx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh3VYrCosvm6Oalt+LyYnRO35JbbQ5SxXykmzlI+S52v8j6eWcQ+uInZkYxkvHWDdzDVbH3Vacz3cDxtmnD54qy/RC9IeVqS4ZLxkuYEHREBhoOwgnDUv94c+4dznZjnFZNckrBqHFjKpQpC1svTyVq5YulJjv9Q2rJgFMs6CXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYvX51nt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476D9C4CEF7;
	Sun, 15 Mar 2026 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773565739;
	bh=HjYvoB4f85qvsndu8SOgOTKaSMRZRps5PYp2U6ltbx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYvX51nt4btMTqx3rBXVQHScRd5ULQjZgaw7jmq9/9B8UFoeejy2zZxl/tHtliMcd
	 OPZG8HdVO2upSq/NrQZ+BZa7DkQ46hHwb6+DbqPZHWdZfUQg2DTYo+HhEgcbZNLxkP
	 ieFQswmetuyw+BsArSotxokJkNwOEJ6HqX9Dji2mKAvSHZjME/1DzTJsF4Eiz2sCwm
	 tDbWPmkUTyby9xJOy2w+wpHr5invcTzEKuuj6SBf0d5b+vl1FL23CC4ZViRpb5Rq5i
	 hXaK7U9c3xVbc4Uw0F75nFtk77+yAQNcjMEjgC8+IcYenzwz6d3ug5PwwwpJ7BuQak
	 ct0dFHHZ0DR/A==
Date: Sun, 15 Mar 2026 10:08:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Yao Zi <me@ziyao.cc>, 
	Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>
Subject: Re: [PATCH 3/3] MIPS: dts: loongson64g-package: Switch to Loongson
 UART driver
Message-ID: <20260315-towering-black-oxpecker-1dc2e0@quoll>
References: <20260314234143.651298-1-rongrong@oss.cipunited.com>
 <20260314234143.651298-4-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260314234143.651298-4-rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13643-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5DA8B2904F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 07:41:43AM +0800, Rong Zhang wrote:
> Loongson64g is Loongson 3A4000, whose UART controller is compatible with
> Loongson 2K1500, which is NS16550A-compatible with an additional
> fractional frequency divisor register.
> 
> Update the compatible strings to reflect this, so that 3A4000 can
> benefit from the fractional frequency divisor provided by loongson-uart.
> This is required on some devices, otherwise their UART can't work at
> some high baud rates, e.g., 115200.
> 
> Tested on Loongson-LS3A4000-7A1000-NUC-SE with a 25MHz UART clock.
> Without fractional frequency divisor, the actual baud rate was 111607
> (25MHz / 16 / 14, measured value: 111545) and some USB-to-UART
> converters couldn't work with it at all. With fractional frequency
> divisor, the measured baud rate becomes 115207, which is quite accurate.
> 
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> ---
>  arch/mips/boot/dts/loongson/loongson64g-package.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

DTS should be sent separately, don't mix independent patches targetting
serial tree.

Best regards,
Krzysztof


