Return-Path: <linux-mips+bounces-9100-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574ACAC3384
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 11:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2A63A7A7C
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 09:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D52B15C158;
	Sun, 25 May 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="jmxeHIhs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA43BBF2;
	Sun, 25 May 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166205; cv=none; b=thVpSp5vjWqd+X3/BkHMe316pdzvY1oaRgt88Dr+K0KlOW7tohTdH2MZF+zoq9cBoZIYMsrwrAzK4LsP+FN7yt6/k+nFfUPTrjBHXwHWAnxA4FfI+2Z59wfqOKGut1X9cNG/4a6YTOY7/wtHxS3FGV90QIOlQLEKd3lls57f9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166205; c=relaxed/simple;
	bh=Z2pS3KTZB/jhVnXTNrjUy5/gkP4Ew1ar/P047Yzz300=;
	h=From:To:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=T9TpKs7NxTEW5rxyN93yf6sf50OvsSMWiffHr80J3gawecVa1jfFZJy5lpEuxzm/nvXVmsPM6udHz2HdCg91OplAkDZtlDg/HEdQhocr+UY4v562fVs0n1Jgqy8ZqIBc384BhZ92GeYpNsacNzKQIsvrw91kvnW2G7mjtvM/QJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=jmxeHIhs; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748166201; x=1748771001;
	i=markus.stockhausen@gmx.de;
	bh=TQG5Bh2jytyY76bfvaOM0aWBcn9ZJpxT3QAxt+xhVMk=;
	h=X-UI-Sender-Class:From:To:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jmxeHIhsIOt6iHoxnYarSPpp5C1WVndVp4tnlnj0jkIPjHWOoRduVPZjcSgCTiO4
	 AlttzPO8Vlit+ezz5TS8wuoLUCyWb9WW+Xdu5GktXMdG63Bn/lTO5GUTW5GEZlnXl
	 2+q6hzEtf+YAadtAFGqZspOdrx3Uk08+0tAzY0cd3Uu99PIaFqHEm9bYQO24V+AVj
	 I9QtzoKuybPK5Rk2wgjTMCAJo7fx6iavMQuOAlZtF8X0c9PjNv53OpWRNB+CbH6GF
	 TGH8y0E2tgj0pHDzsFjSIDoXw4LFpFBBa6rOMrvtzCsZxQCPT4LzeLSRX9xoPr+lP
	 nIyGIS+hg0mZBqKQHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1uKmZu484I-002GS8; Sun, 25
 May 2025 11:43:21 +0200
From: <markus.stockhausen@gmx.de>
To: "'Thomas Gleixner'" <tglx@linutronix.de>,
	<tsbogend@alpha.franken.de>,
	<linux-mips@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<s.gottschall@dd-wrt.com>
References: <20250523151542.3903598-1-markus.stockhausen@gmx.de> <87bjrhqcn8.ffs@tglx>
In-Reply-To: <87bjrhqcn8.ffs@tglx>
Subject: AW: [PATCH] irqchip/mips-gic: allow forced affinity for current cpu during hotplug
Date: Sun, 25 May 2025 11:43:21 +0200
Message-ID: <043701dbcd59$73bcfb70$5b36f250$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHnkP66odaOWfE3QhCmZAMjhBqm4AJl3vxMs7hcRpA=
Content-Language: de
X-Provags-ID: V03:K1:uj+6crtWo0eTQLJ+vhFxRj4w7PxSpqn2NruI1JwYCWZYSJygtsG
 rADr4dP/yICpfaS8V6DzAK4yKztHT9qeqiCCwbwyn6+Tsach2rsjzeNmSEePPrgPo9K9+KH
 GCFJzPFrZp+VcXHhTvUjMICyzFcp3yqdj3eMgReqD6tTww6bDSOcqwnWECggmfo0QazOy8s
 ms3VO+RSokCA2dK0t5pKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XOLjfQ6qOE8=;pO8/AK0wzjHOkT3HgBgQogkV3uA
 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

> Von: Thomas Gleixner <tglx@linutronix.de>=20
>
> On Fri, May 23 2025 at 11:15, Markus Stockhausen wrote:
> > +
> > +	if ((cpu >=3D NR_CPUS) && !force)
> > +		/* In normal mode allow only online CPUs. */
> >  		return -EINVAL;
> > =20
> > +	if (cpu >=3D NR_CPUS) {
> > +		/* In force mode allow current not yet online CPU for
hotplug handlers. */
> > +		cpu =3D cpumask_first(cpumask);
> > +		if (cpu !=3D get_cpu())
> > +			return -EINVAL;
> > +	}
>
> This logic really makes my brain hurt. Why not doing the obvious:
>
>	if (cpu >=3D NR_CPUS) {
>         	/* Sensible comment */=09
>         	if (!force)
>                 	return -EINVAL;
>                 ...
>         }

Then what about an even more relaxed and cleaner version like in other
drivers?

If (force)
  cpu =3D cpumask_first(cpumask);
else
  cpu =3D cpumask_first_and(cpumask, cpu_online_mask);

Markus


