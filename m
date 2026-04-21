Return-Path: <linux-mips+bounces-14219-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFsgMFy452kaAAIAu9opvQ
	(envelope-from <linux-mips+bounces-14219-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 19:48:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243643E2CD
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 19:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDE630068C3
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 17:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BE32FFDF8;
	Tue, 21 Apr 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4DnlMn0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6529CB24
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793690; cv=pass; b=Th6f8hRQHMECWR3Xp/pTU1r4GKBwkVhfGcacOm5m6irDzuWvlQ68LYmFBppvf5CUw9iv9CcF49eVJSr6f6aa+ZQP9+eYiUg9Zw0bnZjhx06WaaCJ/Eid6Bgr8wT8avalkyMBXUghNZ+f+GEGIPpzotNdPs6pCs6cfP3XdK60I04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793690; c=relaxed/simple;
	bh=hcx0YvejmS56JerzIhSsVfjd9XdxU+3Ujo+jeia083Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyBFFfDKXPKi+FXb1gb4JpZTfMzRV2l6FbA5oCehy7euHc/k/NTKPVo0klaR0Z39/+SLMKF/rAFuN6PIlN1PDfBMOZ/GKL8vlO0JF1GciJRRfOBG4xTKaMdh7dh3uQCDIRzziDYvtcciCBHf75RBiJH/wkCmHa2c6FsT+QRNMCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4DnlMn0; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7927261a3acso39622707b3.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 10:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776793688; cv=none;
        d=google.com; s=arc-20240605;
        b=FVadjteIi+9vBo0LKKUhAoJ1wRWPiTpjBSaPhm7oTjw7VBM6l3o8JbDbvgaSYTt37w
         EKGcdzqXyTG4duhYyerqQASsPaAjNa34vlx64RPZHSj4iR3tcrcoKjRF8QjMjh8AtCnF
         6+L5xC9OTzQw4ofnFdPrUV7JVw70laCeIOmxZc7VNHgCkIbb5VcZXkcttSddYNoIr6FX
         CcGBMu5hz3wLb/i3aBYX6rW7bSXMoVYnVuUxbQQ+XA0T6FfWYyICP84vca8I/w2RtQOX
         8hqlIMZuIQ4BGHUtJZ35Z2qPeZ0jm08j4HDjVyGgFOHzKzXUDkHjrpBTI1VGQ8A1thpQ
         gKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        fh=Vu7O+PrhPz/ffDY5BjZFSAkaCrK4bWKGuvEsYURDXFg=;
        b=OBDk2UEmiM6RALki3NltDRgguHRYccJoEmVnSYVCEOAtOlXvWSU4tnHcDdI2AshmkR
         Eyj/WKZl5jSKFM60IR1VRVE0OTvEuWO6skUOoBKWoyBknMl40NwvnJ6gDbbWpFAClBlm
         skqLLsasCXDlY25wZqIIobnQSd4tZUSI+rLLVGbZVxzyGix8GGXZc2YCAHpPwWvGYxSZ
         oQQ/D+hFC5ucekVRScUm+I12M9LmbgWEJHRdLctLZpVTAQ8DO5ACQidqNxCvc1g3R/Jo
         xkKpkXCivm5bwut8c94yHUTfQALewaNn7xkLcuiKHrHVb8YJ8paG2PsIauXF+h7Npy1s
         wuNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793688; x=1777398488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        b=k4DnlMn0nwgZvsc3wFfEyq/BVj360bYBk69WcMHVTbu3DEAuyv+f8FIZHYgX4iAh4H
         PhG0Ryp78+MdHcAeqt7wlRIlPlwCP9NP1swyf8ba04db/pM5OPiltOIZo4Ue2g98uy6I
         cpQt5nzPvenThYtc6/+oKpvwg1ZS6Pkz+7GkZVVZCcvhcJHWm9IgqmHS214DDUk4PiG/
         C+2Iv7PNbf7ciGC/4xX2nlSOH8RPlYS628+qZR5391POGk3zncYWcOxAHBm4midKJyl7
         kldlLHrQK1GueLPrku0zK3JY8c6HPe2D70Nt9KmgW4ePdaUCxnQpm2NGi2m44FfQfSRZ
         kM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793688; x=1777398488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        b=Mx/SfjLYyGq7jSCM5PbVH+4c30dna5el9/sCyvc8m6pKJbk3FeLsJsWW/oaQri1Zbb
         1N9SWFfHoUtpSFuYlM2hv/0EYWDPMj1ydLhiiD9Yo2CjdK/UX6cE2+Uv74M92xpTZeg3
         6vpacPrOFf5ST/j3b+r8wxox7isZ9nPXRZ4hAPS3ibvDFyuN8ep+tqohykRPbd+yXvm9
         nH0wN6mSHr2KQcT24vhnji3/K/0rJPUxz3qnSigxzXBv5eGQWML8HtBM+bOZzA8o1uaI
         FsXc7HHtFw8n2D8xPZc0pEvcXJ5D7arWyMUsOsU3ynBPgdKyyD0zyNY2jAsfaBA2PIJC
         8FRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Uh2rj2zmcNN3nmMr8yAF7/spmq1o7ZgIalnkCli/07h6c6TVFwMXpXvbqPyV128O8nqEHNmvJCCdn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ukKP5rc+bQLWd8mGZuGEDUREZnm28iFqq3b8O9evavERkbhZ
	wtcqY78hOoYM319n3BG3o9i6EQcnStdQNLztI7s/0QzvpE7P2vgrgkD4vEaBGDivff3X5HtWQTl
	quaYwXi2KgldoI0NthY/UeXocfk7b4MY=
X-Gm-Gg: AeBDieuE7B6HQQkzPLX64ygaTYyu+6+Q2ADSdbgGr85PcVOL3XxD7UQ5ydv8Ah4e4tX
	SRNoWhBVqKyNLTnhVcmOi2acLt7xvvNCDYLVEzlg2H1dOH51ZEh/37UNncbS2mKmcyjHL4EyKlE
	6X4aWxtxRDTobMq6h4/CsxCw23/S4X8CP3HDn3qF3labWisE2wRPVFSC1/gPewQv4i10PYoA5xE
	2jANBgRvM4wyT2WC8kAI32TxoafIC6o0iHuQlp6HqTC1F7fZCnoV+SIzn4Z/WIKwP11YHRPFm5V
	L9jYVefMTrf0Nogtl7Z0TbYxtZ3KuZVfkXHzQvMApxQca98NGH/mx7V/0YtCJh9813XRZclt4a2
	HBcj4bCjP+zZWIC9twam9WVRFoXs7an7NsstZ
X-Received: by 2002:a05:690c:385:b0:7b4:2bbb:441e with SMTP id
 00721157ae682-7b9ecefc3e9mr204444267b3.22.1776793687897; Tue, 21 Apr 2026
 10:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260421065507.2c5e3ba7@phoenix.local>
 <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com> <20260421101400.67545b20@phoenix.local>
In-Reply-To: <20260421101400.67545b20@phoenix.local>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 13:47:31 -0400
X-Gm-Features: AQROBzCKdVzPerkFTjJ54Zrsr1a5zXRmBIrK9mgKPR_CiQnkbs5x85ZT4lxTKvU
Message-ID: <CAEoi9W5OWmme-cwH2qiwN6JaFbvyWSUHdJemk4UaRG7zQehuCg@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com, 
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
	2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org, 
	jani.nikula@intel.com, mchehab+huawei@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org, 
	pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org, 
	mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me, 
	pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, 
	kees@kernel.org, jlayton@kernel.org, wangliang74@huawei.com, 
	aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14219-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crossd@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[networkplumber.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4243643E2CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 1:14=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Tue, 21 Apr 2026 12:17:23 -0400
> Dan Cross <crossd@gmail.com> wrote:
>
> > On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
> > <stephen@networkplumber.org> wrote:
> > > On Mon, 20 Apr 2026 19:18:23 -0700
> > > Jakub Kicinski <kuba@kernel.org> wrote:
> > > > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementa=
tion
> > > > and all associated hamradio device drivers from the kernel tree.
> > > > This set of protocols has long been a huge bug/syzbot magnet,
> > > > and since nobody stepped up to help us deal with the influx
> > > > of the AI-generated bug reports we need to move it out of tree
> > > > to protect our sanity.
> > > >
> > > > The code is moved to an out-of-tree repo:
> > > > https://github.com/linux-netdev/mod-orphan
> > > > if it's cleaned up and reworked there we can accept it back.
> > >
> > > It would be good if these protocols could be done in userspace
> > > or with BPF?
> >
> > Consensus for a userspace implementation is what folks on linux-hams
> > seem to be converging on.
> >
> > The amateur radio protocols are more or less specific to low-speed
> > links, they are not particularly coupled to anything else that
> > requires running in the kernel, and the main coupling point (IP over
> > AX.25) can be implemented via TAP/TUN.
> >
> > There are several popular packages that already implement AX.25 and
> > NET/ROM in user-space (for the interested, LinBPQ seems to be the
> > canonical example).  The main missing piece is ROSE, but it is likely
> > easier to add that to an existing package, or potentially something
> > brand new, than keep it in the kernel.
> >
> > There's no compelling reason to keep these protocols in the kernel,
> > whether in-tree or out-of-tree; at least, one has not been
> > articulated.
>
> Thanks, my other concern is carrying support for these in ip commands.
> If not kernel based, then iproute2 doesn't need to worry.

Agreed.

If someone really wants mimic the existing output of those commands in
the context of a userspace implementation, they could write a wrapper
program that invokes the real thing, and extracts relevant information
from the ham protocol implementation, and interpolates it into the
output. It may be an imperfect simulation, but it's probably close
enough for most users.

        - Dan C.

