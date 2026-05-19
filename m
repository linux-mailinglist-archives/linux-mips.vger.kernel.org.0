Return-Path: <linux-mips+bounces-14638-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOLXCCfVDGqJnAUAu9opvQ
	(envelope-from <linux-mips+bounces-14638-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 23:24:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2125852BB
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 23:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5E15302C8E5
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 21:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66963E5EE8;
	Tue, 19 May 2026 21:24:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DBB3E7BA8;
	Tue, 19 May 2026 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779225892; cv=none; b=n7TJc4p5CqBOllAmQiK/6Z2t47/THz6t7rXG5BwAKF3QPR+TotrCmNfsk5X9sM01e8r99i603xwdpfYDyLAIlXs8KTFx9byygPYSFOS3hXiGE/YPmbslBUp57RO1bJXwMEtqJE4TMw5Kw+jMn5JCaBxxg4dwQhah+nh3yoamOxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779225892; c=relaxed/simple;
	bh=7lWdE4pSeh+FQ3RxetUkp0P9c+D9pL9NQT5+F70u3M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi+J8GK51fp99s6uE+KO6WcexQMBnQ6rwraoyqqlxn206yOsKlmIwOlsokPxRnRgnvnXEJOt/dHsuRWf9h2tnm7jM9+COL6aOckhEk4n2WTvweG4Zsf4VSGvJR8gbM9PFOcf9tFTQjxR/VzPxUnprIM2K8iNV/3utwZ9JUoyOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wPRmd-00067U-00; Tue, 19 May 2026 23:15:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2B82FC04A1; Tue, 19 May 2026 22:56:39 +0200 (CEST)
Date: Tue, 19 May 2026 22:56:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Manuel Lauss <manuel.lauss@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Message-ID: <agzOh-YwnE7Utr0R@alpha.franken.de>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
 <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
 <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14638-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF2125852BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:52:16PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 5, 2026 at 3:31 PM Manuel Lauss <manuel.lauss@gmail.com> wrote:
> >
> > Hello Bartosz,
> >
> > On Tue, May 5, 2026 at 11:09 AM Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > >
> > > This series of patches updates board previously converted to use static
> > > device properties/software nodes to attach and use nodes attached to the
> > > respective gpiochip devices rather than simply defining unattached
> > > software nodes with matching name. This is a requirement of newer
> > > gpiolib code. Note that there is currently a workaround preserving the
> > > lookup based on the software node name, but it will be removed soon.
> > >
> > > The additional 4 patches convert the remaining 2 boards to use software
> > > nodes as well and fix some build warnings.
> >
> > I have run-tested this on the DB1300, without any issues.
> > Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
> >
> > Thanks a lot!
> >       Manuel
> 
> Hi Thomas!
> 
> Can you please queue these for v7.2?

sure, will do.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

