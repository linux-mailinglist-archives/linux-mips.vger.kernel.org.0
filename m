Return-Path: <linux-mips+bounces-14823-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNgsJfE5Gmpr2QgAu9opvQ
	(envelope-from <linux-mips+bounces-14823-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 03:14:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0160AA7C
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 03:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C32A304B2B7
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 01:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDAB27B353;
	Sat, 30 May 2026 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAANPdkG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937901ABED9
	for <linux-mips@vger.kernel.org>; Sat, 30 May 2026 01:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103502; cv=pass; b=G1+fMo7S5aVnRNSemDrsF5b5u+bo+0gj/eo5O91Hj2phOYFE4iJ8YXN/IgFpp0nis3wtLoFK01gb5xXn63AZtZmpDigleD9soItPfGSE6maHz734pbwjuISEzPGjfLkt/fyspMWGWDW4YHfnV5L8eTuDCKZvMlevupuHHiS30lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103502; c=relaxed/simple;
	bh=LtS4z2dvZeUTttgZj7F4eURUbCuoBFaUct9qvj48LnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+RpLDhfTGssdKpfkuY73YLHsLW5Hbg55ZpQE0gyi/GwBVs4assNitjswfe2VjSVZFNgezhOKPoc0r/tlctpdJeQ5gc/9SFxt9fGN96nMpnlRdoLHNz61cLBYuI8D8vhlUS45sy2QZQ3UZCL8eytHkN8yfcKdykRD7IaDNFAzLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAANPdkG; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso2667482a12.1
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2026 18:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780103500; cv=none;
        d=google.com; s=arc-20240605;
        b=VJjN3K9NQmUw/7ZcUnW7ay7pM1AMO0zKufHfox/f5AqMdavr7SAFwcMV0Nn12DvTbm
         uaGYMe8jKfUPjWbBdU4KSMDCnDdbBzvJP/XmV6JOmu5q8/dp127Ad5hBeFjrIn9q/QLd
         5jHrXL36p2J7JyUwI7nFohvlXY101IuJkNHIRqzLDvYSo3fbqSEpdmTqfTXSjyNYdFYL
         JLgyL+ImbIpFjeojKTdVviXTzfKDIO9Ro5SR75X6tJIHY9He65d3BksocKDjcUyh75Gk
         CXPzScIW4JWfQ0vXYKG+XfzD3sW0kMJciAVCLlzcvePA3xA1A26pLHFfpT+09jeya22f
         MEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC/QOnNhg6pGVvVCtc718HsVdCseX0VhkmB1EZGxDJg=;
        fh=GMJtEvd5WXmYZB235BlexY2DEhr74ebqhxTFTZ3sPfU=;
        b=PMJt39JvJx1U1zl5bjbp4X3TWON+GVFK7TIcyVU1EU+0pWa4VPjMWW9KX4tOwUGthO
         XApdVzUvGZy/qiPwUR2Y8MMtZilempw4chIhceyNB7dm9ABEmYSYhhwoc7xIHeTdY8U9
         ndEpFtq1itDsA0OIEZZta2w9OrumjoLd7jXdHIFqxuikwHyIahJTf3moC7pPNneQjU8L
         /RwJNWHm0I+snU/Q44zYrPZBdba7XmSv/6XybF2HS9PR8/pcaKnh/lZHPf4LpnoSuZjT
         ACVr3fQu58xEFD1gUFpDDUhVtXWFt0xY+9NrpIOjamIHCoENspqJ2UsSPhGtgDZ90qya
         Aa1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780103500; x=1780708300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wC/QOnNhg6pGVvVCtc718HsVdCseX0VhkmB1EZGxDJg=;
        b=VAANPdkGsorDS++y6/OWAFK2ur3LTWRRkY6mpmA0YYJdw1YDtT22BPVzJ3mPHn0Ewu
         v3thK3BAIfQAtDI8Vv/D/55bCatxORvP9Ef+HUxLL7QZnpaaytdrm7fnoSeUiMk2HeJy
         cL6If8FMS8mmNOt3BeqADHLtZ7yl5D1MKhWfKOMe3RPFSRBawFuvpC+nu+VKJgScw59V
         LF/qeiifeDsf2q64nYeLRhIzFl07DPxFZ5AH4/oG0O/Qas6SToCfGq5pt/7Zxhv/4P7Y
         x99shd8w4ADlqHU0e2aLUD8GYCZUvXQohuU69WLRd25/Q4WLPOzwZwefwVun0sQ4HS4H
         HZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780103500; x=1780708300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wC/QOnNhg6pGVvVCtc718HsVdCseX0VhkmB1EZGxDJg=;
        b=mgmh4BE3ixWkdUDQarINM3Pfw0rSww288bp8iQm4DmusCOy6bihmlswoKgKDKYeRX3
         fWIDtDJuPS4z12Yklvsf/vMIxXWsqQu230m/BXw8kImEdpzON48kC2Pb0q99RmqGRoig
         7RGj+Ilhhtq+1Mm085o+IqkPH3ap8nVRicWbeFCgq5jXmm+swwK5H/GA71EV8Z4xJn/M
         pdqqw+5ey3f8uOZwDe3jT2tv1zRrtQ6JSTNuMTkiSu2hbWiXv8kj0I54MPFN/mc9ySkN
         lB1zmilMhqBiZ72bI0/L0ozYzt8SJqDigl3c/+FvcYpMqRBZSsREF8WqusHlDHAYYq0D
         AzJw==
X-Gm-Message-State: AOJu0YxRHGmdL8fuLTGU3Aj/bXpGqbLU0osauABH4BB80YiZQKvKQrr9
	NLiJMeU2CwxkHdAJYI7uXuUBHC1IQ91cBe+DAS4HJQLkjR16TShw7wnVAl/86L/JCXT7YeL/gg9
	/4IeJgqmWeYFzbUmrblUq7UQPCYjLAgaeHw==
X-Gm-Gg: Acq92OH/hKVCPglkA+Rt9rZjmOG9QkNUm1HauWR8EQMSUnwA9I2w7aGZ8aTNCcQ84+a
	PWvHsliz7q2jb+fEZAnDcw3cdxZ8UIAm/tscXI2u7s0j1vfn0Y3L7unQbUKH2JFPHM0HqlEPxiL
	ktzGqbeg21elfyLPb0MfF3Iuv+/Mxl+R9QZTP5s4+tQJ7zOuCgAKOSVdjwXaW4vhH4hTb2mbv1J
	+76SupM5TKQhxvA2IxqJuIJF5kD8D/Go0tes+WQApT8TOgjxSUuvLi+ll+A2ShF+1jMsNsXmX1+
	/emEGzAre0PA8OaoGYx0gRsx/jtEC8jaqFqByM3IG8wrElVuWzCSlcuRLkmSmXfOVgWKzuZDTIL
	BOSyBl0VL5kgTTHuWG9TvLXz2s7+bhhiz015xXPrxFD8MHAdQaCnmw3ZyyEDfToFzHegm
X-Received: by 2002:a05:6402:3246:20b0:66d:d2f9:520c with SMTP id
 4fb4d7f45d1cf-68c8c93f44amr740919a12.19.1780103500024; Fri, 29 May 2026
 18:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528035943.719613-1-rosenp@gmail.com> <ahmB3YdrR8asjKKu@alpha.franken.de>
In-Reply-To: <ahmB3YdrR8asjKKu@alpha.franken.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 18:11:28 -0700
X-Gm-Features: AVHnY4IJW_ULTcm-ZrnGS0OO6FX7FZHI_h1wyxziL2jPlQWjSUB6qm-CXYbGvwo
Message-ID: <CAKxU2N_6-J7J_yYQVJxQwYzuunLT+RZAdg2ETfUp3d1xq-uuPw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ath79: pci: remove
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14823-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EEA0160AA7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 5:09=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, May 27, 2026 at 08:59:43PM -0700, Rosen Penev wrote:
> > Commit 85b9686dae30 ("MIPS: ath79: drop platform device registration co=
de")
>
> this commit doesn't do anything with pci at all. Do you mean
> commit 73d8e6aa7d20 ("MIPS: ath79: drop legacy pci code") ?
Yes
>
> > removed the ability for anything to bind to these drivers and use them.
> > Meaning as is, these drivers cannot be used.
> >
> > Downstream OpenWrt has hack patches that add the missing OF stuff but
> > those are not suitable for upstream.
> >
> > The current plan is to rewrite these drivers using newer APIs and have
> > them live under drivers/pci/controller. But as for these, axe them.
>
> wouldn't it make more sense to revert the commit above and remove it
> after the change to a new pci implementation is really done ?
Why revert then remove? Even if that commit was reverted it's still
unusable. ath79 is OF only now.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

