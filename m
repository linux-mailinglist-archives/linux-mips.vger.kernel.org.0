Return-Path: <linux-mips+bounces-14075-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFJ2ES6p02k4kAcAu9opvQ
	(envelope-from <linux-mips+bounces-14075-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:38:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B42663A357C
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDE90301841B
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 12:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2595C34405C;
	Mon,  6 Apr 2026 12:35:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDD933263B;
	Mon,  6 Apr 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478912; cv=none; b=I3pwjebWf6f//AL9mwO+RPBVKVeVaXb5EvFJuxm3oArrg0oIThoNjgTig8vKD7CJ/VRvK8htfBITVV/xy7EKdaxlHQmoY9uVoBjykSjDVj3FDSUvTRd80dh7A8DiEMga6qwlqPXzhcDv037wZMab1bN3bCMu6bvQSU37/qtNX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478912; c=relaxed/simple;
	bh=vo/6lo+iAkG6UawG71EzFRxbyPgiOp0wfB7hhPyA8g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhHSijcH3z2UuyqCTdmJN+KRcCFnayNJNQzWOsKeR2PRlRKsKxIE679o1rE+sVTsymCo+V4C8DqBzxe4I7AfExMQmMqKFMOA3rwLPzZJsWG06YXEaNlQRgiaADePGWczF825gOeIk1ZRujuSbKBEG/54EZ8MfF+Kco5h3Cuz0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040t-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6973EC0DC9; Mon,  6 Apr 2026 14:32:19 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:32:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, Yao Zi <me@ziyao.cc>,
	Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>
Subject: Re: [PATCH v2] MIPS: dts: loongson64g-package: Switch to Loongson
 UART driver
Message-ID: <adOn00g-uE3-vRXS@alpha.franken.de>
References: <20260315184401.413975-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315184401.413975-1-rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14075-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.601];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B42663A357C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:44:00AM +0800, Rong Zhang wrote:
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
> This patch targets the MIPS tree.
> 
> The series for the serial tree to update dt-bindings and enable building
> 8250_loongson (loongson-uart) on MIPS Loongson64 is sent separately, as
> it's independant of this patch and can be applied in any order (the
> compatible strings here still contain "ns16550a", so no regression will
> be introduced).
> 
> Changes in v2:
> - Separated from v1 (patch 3): https://lore.kernel.org/r/20260314234143.651298-1-rongrong@oss.cipunited.com/
> (thanks Krzysztof Kozlowski)
> ---
>  arch/mips/boot/dts/loongson/loongson64g-package.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

