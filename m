Return-Path: <linux-mips+bounces-14218-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLIqIHyx52lZ/QEAu9opvQ
	(envelope-from <linux-mips+bounces-14218-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 19:18:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED543DD7C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 19:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA9EB3078845
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 17:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832E3859FA;
	Tue, 21 Apr 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="NvW7V6zz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16B37DE91
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791655; cv=none; b=T+S5HJ6CJXcbESoOnHBDYUNJTi3CT5SQI0x57xBXTBBRR7Mz+4/XwQdbAZx3Az4VrdjdHjRjaN3N7thKUeX7C1mz5MEYciIPy2sav4cU1uLQC0kPvSGO67emT8DdB+7h8sDpK0V6dZrpTUFnl3Ma/GsmC9aWpJ8gV95eJ/PYsm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791655; c=relaxed/simple;
	bh=zQnL2fW68Yjh3nCOMT6xZ/h8HA0NEQszG//OMuJePKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c61mD7RgbBHZlc+oDoHe4KZeJj+CDc3IkFqO2EpP3EESIIMNGq5WJM+qlULCOsbqhGtgtMUVexHJsNkrpmj4BbOVRikbaryzwiVYcsKgADM2z6CyUF3K/zszxHI8avkDWK0F+8J/A+jOOlpezjcfwRAIKMJGx2dUxiVMvz0X33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=NvW7V6zz; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d7fdb922a5so3991739a34.3
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776791652; x=1777396452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMUefLi5WLFFDpzONKvGSaE+pHGV5IKQnKH5bOuejr8=;
        b=NvW7V6zzd1x+UE43BMBfEQa9F0nUc/TYYexl0y1qR+9U6vuaV+T7OJJRxDHft63EqR
         L4naPKQ3Z+8FRDE/eROQdVGGNrM9Haq2RwSNTe7ysNfrf5RwfkBhPC05bLZ3LinnGRUG
         NsuYfz0sa57kHPfD4ZqhRuw9wZAnyKmptAmstA5DxACpfAk1yTRVfnAIrpmerIpX7jx6
         ZOMCnjk39X74xmZtEFDFY7W9o7jVSLr9yHa8R1idEw9LZDlGQV+14D/wcyPYE2h8eAPt
         LSPAv8HtYN/JhlHqcEurDEmISmb/V+jqFelSsJWP8ldW1aJLdJXFI9M0GetP6iHavUyB
         PCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776791652; x=1777396452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMUefLi5WLFFDpzONKvGSaE+pHGV5IKQnKH5bOuejr8=;
        b=ZYEimfBoVRiv++uX44wt/ydvKUHn3bgpUIab7t+okIh0FoIns+32Hq5Ul8uDsFyp7G
         /y9vXImYNjDQ/MBSL06Avu3BalxuH4zSVhYgbEkHxFgbhrbFiSCjT8xR4/moneIkkuZX
         /59WUooBuLMLG5GIocvVWV+yo+p9dVVlsE4N1Jz7IphvN0enxOOBl7kCHv3kRTqwS9OW
         v0smgVQxCrcPmt+vM8VTGbmZlBhXQoftVVe8g2KDSBSe0jLQz5YjwmRr7ncjV2QzvFiL
         95ctvv1nTbwp9aFcs1vDmgMYWu7W7YW+Y7QYFG0XRCVapzp9ww6LDcIFHFnu2M+cReMn
         XkUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IcP+gV8pzxQlMDfflq0jOPPz9jI0G0MFcw5HCFGbIMZDGVZ2aoaGx4Pr7ouokOyCZxkMJLly1nMrs@vger.kernel.org
X-Gm-Message-State: AOJu0YxJniILCdy2fc9M03NPHEfFpeCK+MLNtBAuffA8lEZu/taOs7OY
	9T8KehUsmRuE1OretJVShl0A0YSnr+/ZVdY/hJ06E17OixI7FduLzlrI7AUWYhAF1AU=
X-Gm-Gg: AeBDietY9hLwEU4ssV2Fscu7weqz4fUY1EE9na9ZRWxz5erupRh3nCn0axDf0Yscpws
	AIbqPGEcShFJ2Fdz71bQdklpiO5+ZTnQzmDmAoHKiyRCtxiiwgsjPtZbCYNcESffPdw0lOjUz0/
	4LvODCMcAUtIniToJ5KDnN41D4LlxWwXSXm4b+0azsDoMVFpnGf7cdR5CjBDzxAF6E73RaPPx5w
	tRPmKDZQ3ryDKiX5Ed+wO4mqcf6PlozPLOSgTxwNOldzopJHUFgHSGkAkXhX9SoLdI1GcJzacjl
	TfuXake2tUjoE4iUSqyY79TC0i6xRPvE1gKEsghL5E4rvujTGS+fsHrhT9ojLqybraVthn/Sls2
	Tg/XEpZL/Gg7QNWMw9TvXzPz6Ov1A030m55818PBfy3o9uoHjepKbmOo+/w5BIGIS4U2LQ1ki23
	qgtwd08Sxs2hicSfDfUa2FH9PjidNYaZusj37AWp8g5DwhoQ==
X-Received: by 2002:a05:6830:8d0:b0:7dc:e38b:d9c1 with SMTP id 46e09a7af769-7dce38bda62mr402872a34.13.1776791647395;
        Tue, 21 Apr 2026 10:14:07 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd56bd0e4sm3393742a34.2.2026.04.21.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:14:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:14:00 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Dan Cross <crossd@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 toke@toke.dk, kees@kernel.org, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260421101400.67545b20@phoenix.local>
In-Reply-To: <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
References: <20260421021824.1293976-1-kuba@kernel.org>
	<20260421065507.2c5e3ba7@phoenix.local>
	<CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[networkplumber-org.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[networkplumber.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14218-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephen@networkplumber.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[networkplumber-org.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,networkplumber.org:email,phoenix.local:mid]
X-Rspamd-Queue-Id: E6ED543DD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 12:17:23 -0400
Dan Cross <crossd@gmail.com> wrote:

> On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
> <stephen@networkplumber.org> wrote:
> > On Mon, 20 Apr 2026 19:18:23 -0700
> > Jakub Kicinski <kuba@kernel.org> wrote: =20
> > > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementati=
on
> > > and all associated hamradio device drivers from the kernel tree.
> > > This set of protocols has long been a huge bug/syzbot magnet,
> > > and since nobody stepped up to help us deal with the influx
> > > of the AI-generated bug reports we need to move it out of tree
> > > to protect our sanity.
> > >
> > > The code is moved to an out-of-tree repo:
> > > https://github.com/linux-netdev/mod-orphan
> > > if it's cleaned up and reworked there we can accept it back. =20
> >
> > It would be good if these protocols could be done in userspace
> > or with BPF? =20
>=20
> Consensus for a userspace implementation is what folks on linux-hams
> seem to be converging on.
>=20
> The amateur radio protocols are more or less specific to low-speed
> links, they are not particularly coupled to anything else that
> requires running in the kernel, and the main coupling point (IP over
> AX.25) can be implemented via TAP/TUN.
>=20
> There are several popular packages that already implement AX.25 and
> NET/ROM in user-space (for the interested, LinBPQ seems to be the
> canonical example).  The main missing piece is ROSE, but it is likely
> easier to add that to an existing package, or potentially something
> brand new, than keep it in the kernel.
>=20
> There's no compelling reason to keep these protocols in the kernel,
> whether in-tree or out-of-tree; at least, one has not been
> articulated.
>=20
>         - Dan C.

Thanks, my other concern is carrying support for these in ip commands.
If not kernel based, then iproute2 doesn't need to worry.

