Return-Path: <linux-mips+bounces-14639-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEwbLrFdDWpLwgUAu9opvQ
	(envelope-from <linux-mips+bounces-14639-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 09:07:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C175588A8F
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 09:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FE503028E91
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 07:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAB1370D4D;
	Wed, 20 May 2026 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIK2dpIK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9013603E0
	for <linux-mips@vger.kernel.org>; Wed, 20 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260846; cv=none; b=YUfD7R8Ls2odL9zWn5MBV2U6xeF0MVkKQ6T5AvxRwk7kDK81/5WAP+lviH9gFH/HmU8fItP4VBP8gc47nsEevGj8iXedBtNxf92j4eEa95hneyfuI4OGKPZQvmBYwvjwpb+bHTEVjNGIY56SwQvgjU+l2uOTO0EvsxmjZNz6jWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260846; c=relaxed/simple;
	bh=PVODDCsnExf0U7n1rm1yziZ4tpaSGWufVmnzl4zPRzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQ4MP8Bk87pVIOC5C3p76zwTf7dydTqPzX0TBT3yR/KTVBTzcgxRPNeMzU5wPcTvb3mU0gtsXpesuKhxYwHB6TZC5mG0j0bBNvDPNyevZ9z8vD9H5SCa7/p0RMEvjZomaxeWg3dkteoxIi86kdGVptWokAvV9QDsoKFsmRrn3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIK2dpIK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093211F00894
	for <linux-mips@vger.kernel.org>; Wed, 20 May 2026 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260845;
	bh=Ib3uZeUh0c2fhAN0uOBBIaw5zXDxfNCpRjAyRvJmO60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LIK2dpIKBD9aKE5yfyCSHlVXjPSEZb4Ox1doWVst79Xca1hpfyTZ7xaPNiYUCPVIT
	 7ifGIEiJTkYgah3kbWlUtHBM7jHW5WlnAKMEWAEwRrH2Y9PqwmnvPxsf55LYxVQP/+
	 PSdEk5TZP8/ImHX5BwMYRzywfl86XC/v8tkxCGXayaI9ahuk992DdCWbSIHcXjLvBD
	 wTkQMFXQubmKN28FZB1l86t5Gu2m9JZH68ReKDCChy/IK1aPC6tYQYYGhJuEa/5+sk
	 qtp99dv138Ccs+zMF7XF8tGPFoChDdOclagrbRPwHFFSnyB0t+XaAbWHZepE7j2LeV
	 cv0644W8M2dhw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393da8f389bso43396271fa.1
        for <linux-mips@vger.kernel.org>; Wed, 20 May 2026 00:07:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pyzruYuARHwgpmlERr5YQQIhcNlBtNFmJrG64QSBKCnwju6ZW2MAMnP/V0+2B5HcdW6TXFTfDNBpE@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFbJ/+/RXshHdqZjKd5Q9wFpjVxKO64Xo0c0r46rA47LcJ6kK
	MGUoBpgBWk+HeKWBsCTBc4vtj/nYqoL9P6FmY3umbTnXYX2r/pIrnBttLjDzmUKgey8IuacWqII
	D93jcRhW78zADFdYbzY1udWm5sqBzSPV9h8gBymRsyg==
X-Received: by 2002:a05:651c:1587:b0:393:a639:49fd with SMTP id
 38308e7fff4ca-39561dc815bmr69793251fa.22.1779260843756; Wed, 20 May 2026
 00:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
 <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
 <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com> <agzOh-YwnE7Utr0R@alpha.franken.de>
In-Reply-To: <agzOh-YwnE7Utr0R@alpha.franken.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 09:07:11 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcw4ASoKpJmrjPKOqzLkbc6oLuFibd8E130Ehj1sAeSpA@mail.gmail.com>
X-Gm-Features: AVHnY4ICL8sRKm8-Rs96bCgr7f99fCNjdem43ZA4q4xZew1XCMOKGrxpEj5iCo0
Message-ID: <CAMRc=Mcw4ASoKpJmrjPKOqzLkbc6oLuFibd8E130Ehj1sAeSpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Manuel Lauss <manuel.lauss@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14639-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C175588A8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:15=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, May 19, 2026 at 01:52:16PM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 5, 2026 at 3:31=E2=80=AFPM Manuel Lauss <manuel.lauss@gmail=
.com> wrote:
> > >
> > > Hello Bartosz,
> > >
> > > On Tue, May 5, 2026 at 11:09=E2=80=AFAM Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > > >
> > > > This series of patches updates board previously converted to use st=
atic
> > > > device properties/software nodes to attach and use nodes attached t=
o the
> > > > respective gpiochip devices rather than simply defining unattached
> > > > software nodes with matching name. This is a requirement of newer
> > > > gpiolib code. Note that there is currently a workaround preserving =
the
> > > > lookup based on the software node name, but it will be removed soon=
.
> > > >
> > > > The additional 4 patches convert the remaining 2 boards to use soft=
ware
> > > > nodes as well and fix some build warnings.
> > >
> > > I have run-tested this on the DB1300, without any issues.
> > > Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
> > >
> > > Thanks a lot!
> > >       Manuel
> >
> > Hi Thomas!
> >
> > Can you please queue these for v7.2?
>
> sure, will do.
>

While at it, can you also queue these?

https://lore.kernel.org/all/20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.=
qualcomm.com/
https://lore.kernel.org/all/20260430112410.65986-1-bartosz.golaszewski@oss.=
qualcomm.com/

Thanks
Bartosz

