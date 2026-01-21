Return-Path: <linux-mips+bounces-12980-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGhQOVp4cGktYAAAu9opvQ
	(envelope-from <linux-mips+bounces-12980-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 07:55:22 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91618526F2
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 07:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76D103A3B67
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 06:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB4743E481;
	Wed, 21 Jan 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQv47LEj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3868241C317
	for <linux-mips@vger.kernel.org>; Wed, 21 Jan 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978342; cv=pass; b=ahaVIP+jQ+RuSp4Vq7E9SbTeGEPobGyslseAe3xWocyQ73IhUroVdFFTi7ohaD1MQUEiFkd0XRTeQ5Jm7FB5xeO41ZTYW98oQvWNp89OissNOCRNKAfE6NquDBlvgtR8fY7r4qQ1Jo8WUfLiRrEMat5sUaAbaQgX4g/sk/JA7xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978342; c=relaxed/simple;
	bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HX0lmzKa6+0zuT8vennTmqZP6kzJhZtMa8t99Zn5aBONXO6MrciJAOtQsll//BPIeEA1Nt0fSCerzN08AitonvxOwqEbmruyNu2k4Q2RlWRi/pti6YqmiA7PGtXjKhpGe0H3eBc0GMTS8O8E656iSGE6F74XhN/6iWnSB/bQrnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQv47LEj; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8707005183so1056112566b.0
        for <linux-mips@vger.kernel.org>; Tue, 20 Jan 2026 22:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768978338; cv=none;
        d=google.com; s=arc-20240605;
        b=S73PNtS3m4Xquxnv9oWCi+rQw9Eh5o97qyZC0AKVrTzRbwmWA9yhdUvkApqg2gEVlm
         Xxyw5ggKybeNC3jP4ezmfJCOmsBaCwYv228EWyfdY03LcDNct0/P5NQRRaqTHbsjzeqt
         oi6arBKTDfYsLxR1LjPzzRBqC5CdWkKmO1SYZfvtjVL6DZhHN20EEfIau5hNBxNoBhlB
         f5kgpHZwrYdx/bV+Zu6RTEKEaCZ98otwDkEFJT3uLAOvUC1uzw0V0ljkMPqjiChG33RV
         td8f26YA03aMzli0RdIwsN9tLt9Na4q+i44mwWdTNOYcqgPsJph3g4pjQTKNA6DlcOKE
         dLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        fh=wHzHWkZlF1nwzivWcby8IjUKbc9aEsW/DnIlGHlDEs0=;
        b=ZVP2asdW2FIi6reqYTApu4iKw8XXjqx69WjVLYm8sqmYWEWCxu81BcMeoFV9N6FTxP
         6ViC23GsCpMx5fASfXUbUUnsr9gQdcYOSREGu1ka2Z0K7nNd49vr/ruK3NeUHVMKOKrv
         xQns7xbQiFS83Lft31AMO66bGsBi/79JrDBbzxZpKAsPcImtrVJFArT5Cd1MFipdXSoP
         MsmuZjrFaerX0cPvPwj/5byspmq9PfpYa8rrZ7gi9tp1OHk3bkOr4Ruqmn+QsziFcK5u
         VtybJ2cTTezanAWeCa7fELBY6oTtheVvCfcdaauC8YD1XZS1rtEfMoAMXVIp3IySrjVv
         nKxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768978338; x=1769583138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=XQv47LEjDD1lkdImoejyGI5QSUuasobMBIELUSVVQD/Or+QUGKf1pkaSoiQHQjsdHZ
         DS8HVMZHL8MjXrThfqn/x2ZZC6aUgT10+Kyz8im66h4tYX9Hled0lFzsX9qNXSmQmU+5
         luzi0/C/pUPJmDR0I+TxOlLQG0ISKuC55sfEzXwkQ1e3nYG2gUSTL11Lyb8sz/FuVzes
         pisGdz6z2BwoJcIU9BsGuThX3Wrrrs61KxpVzzdASwgeRGURKVn/BsB8BJwoQ1gMtKs5
         Xz6+G3yY2QJlL8g4VPL8SHza7kQ+aQjSbiRosdYnxphM1P9fGHGCNtt4t+EURXslP7ne
         VoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978338; x=1769583138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=vpkqrGd1zpXMNjbIjzrJEsfl8YbJ2aWm8fTfJ2IAQcbmfE84Tz6XmUSeVqojlAN/XX
         J0rR/FFNnfbBhNGc52qq8x3Bi60vHDlgNF6S+OHV6wc2DtAOrQdavdl89lbY0+FoevjY
         e7Vl5QdYZSc0fP2jnaA86LHt/J3ODxuV3aH5Z+2avdZknp9gGOM07c/oTmCWdO60vjTp
         T2bVxzcTKMHdIHONW2SFxjhrow3jaEtr+o0OmurNbeNQeNsQaYsRiMpvcwk3hDivBG9a
         QiBc6IejyBFmJlLnBz4w5yPkitQbLZ2b8UlH96XJcQtkb9cz7VvV6PUPx4QPv3bB1V7i
         q+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+02gsAaP7bHNGTbV0iwjuuOoiIUfxxhfOhL0UTTTCKalSLeaEWZN7H/o4cowxAdmewHX2tpiFvNXA@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlupVWOi9XBMHenI5BOP4oFZOP7YVN20Dy4Y1KlyPFP3kndpo
	60hMMkxkvKGj+G7lDDhv5I4ZmYr15xBxF0ddsN5WA78H+rtkf4w/0f/q8hON8lGWu/jV1qRAMcC
	2RPKds6pDPQcltYUf71yBaQ1WXnz84zs=
X-Gm-Gg: AZuq6aItieXXe/WtgwacrbxzBKD4vBfsDdUTea3GBNbhKpt/Y+q0CGGc3y1xwYZ/rRf
	P5WbVNKp9uPQD8CDr3BtJ5qeUQDvM6SW9i6l+j06bBL7m5TshI5LZN+5l0+xGY0UiJzNofp1l7Y
	tAyutHg98s5FkNImGJHLxu33nh8VHrLLByMnOWkXhRqUJAmwGr9dMn7I/OTwa6mDWnHcc4cbH8k
	EQxxNU4GB9B+IHEA1ctWVYixB1i1o/gFij+DrkFp5/H/YwoB8YBLmhr0xnFECTY1Nr9IZI=
X-Received: by 2002:a17:907:3d42:b0:b87:35fc:ae6e with SMTP id
 a640c23a62f3a-b879327dfb1mr1455742566b.46.1768978338185; Tue, 20 Jan 2026
 22:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768616276.git.zhoubinbin@loongson.cn> <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud> <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud> <20260120224920df0cf2ac@mail.local>
 <20260120-proposal-retry-d0a1f3de10ea@spud>
In-Reply-To: <20260120-proposal-retry-d0a1f3de10ea@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 21 Jan 2026 14:52:06 +0800
X-Gm-Features: AZwV_QgA6UvIfzq-IFvgjS9upO0HXk3JXVuJsZZ81j4MJRt35v5CeDrdmHWS9o0
Message-ID: <CAMpQs4Lm1Oq8L+dY8OnseV-NNUoD3+0QjnZATRkmR-sejCKAdA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12980-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bootlin.com,loongson.cn,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhoubbaaron@gmail.com,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 91618526F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor & Alexandre:

Thanks for your reply.

On Wed, Jan 21, 2026 at 7:39=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 11:49:20PM +0100, Alexandre Belloni wrote:
> > On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> > > On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > > > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > > > The `interrupts` property indicates an RTC alarm interrupt, whi=
ch is
> > > > > > required for RTCs that support the alarm feature, which is not =
supported
> > > > > > by the Loongson-1C RTC. We exclude it for a more accurate descr=
iption.
> > > > > >
> > > > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > > > throughout the existing Loongson DTS{i}, the description of the=
 RTC
> > > > > > nodes conforms to the modified bingding rules.
> > > > >
> > > > > Right, changing properties is an ABI break, but when following th=
e ABI
> > > > > would've produced something non-functional, breaking it is not re=
ally
> > > > > relevant.
> > > >
> > > >
> > > > But the HW has the interrupt, the fact that is not functional doesn=
't
> > > > mean it isn't there. I thought we should describe the hardware?
> > >
> > > Does the hardware have it? My interpretation of the commit message wa=
s
> > > that it didn't have the alarm feature and thus no interrupt? Unless t=
he
> > > interrupt has some other purpose, in which case yeah we shouldn't acc=
ept
> > > this change and only the new device should permit there being no
> > > interrupt.
> >
> > The datasheet shows the interrupt coming out of the RTC and it has the
> > proper registers. Why it is not functional is not clear to me.
>
> Right.. Perhaps Binbin can explain that then? If the interrupt is
> actually there then the dts should get fixed instead IMO.

I carefully reviewed the manual again and believe this patch is still neces=
sary.

First, the Loongson-1C RTC does not define the timing interrupt
register (`TOY_MATCH0_REG`)[1], meaning it lacks hardware support for
alarms. Consequently, `interrupts` are also unnecessary.
The Loongson-2K0300 is different. It defines `TOY_MATCH0_REG`, but due
to a hardware design flaw, accessing this register causes system
crashes. Therefore, I must also classify it as lacking alarm support.

Additionally, in patch-3 [2], I rewrote the alarm logic to decouple
the `interrupts` property from the alarm feature: I defined
corresponding workaround bits in `loongson_rtc_config->flags`. This
should be considered a SoC-specific attribute.

Finally, two thoughts:
1. Retain this patch; it is correct for Loongson-1C.
2. For Patch-2, still add the `interrupts` property to the
Loongson-2K0300 RTC node (as it exists in hardware), combined with the
workaround bit setting in patch-3 to avoid the hardware flaw.

Would this approach be acceptable?

[1]: https://www.loongson.cn/uploads/images/2022051616223977135.%E9%BE%99%E=
8%8A%AF1C300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C=
.pdf
(section 21.2.1)
[2]: https://lore.kernel.org/linux-rtc/abff68dda2fe6a6601a9e58b31e278d94129=
7fce.1768616276.git.zhoubinbin@loongson.cn/

--
Thanks.
Binbin

