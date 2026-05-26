Return-Path: <linux-mips+bounces-14760-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFr1LJOyFWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14760-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:47:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B60BD5D7E12
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53583300382A
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F7A3C8C7C;
	Tue, 26 May 2026 14:36:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73433FAE1D;
	Tue, 26 May 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806171; cv=none; b=TUk/UL86lfmUkPtZZQNd5Af3tCZB2PSBXD23FFlJcvyugd1HEsDdKjaHB3JmgQ+hLKsxvUEjiRy6yeOpMpIlEqhTBfYyccmuabqMHpOKzG3rV4uYjxwCFNCgvfx1/VLTziD7Zv7icpW7VAgNbEZBWVwWZPeyExMNV0kzKGGGT3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806171; c=relaxed/simple;
	bh=MaLJ7FEdn4+9c/++l3kifXR3IEqyH5mvDfTOZqDNE9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHFRzB4yLHrLKKPU4XBCWI4EY5bBHU/f4xhcpMJSqz0o8xF+/fQr07FB+RuNPhoXs/9osB3BpGUzQSxvwOBXd7wkl3+ay/PS96vl1Aub5AIXiiQVljF+iqYtjHJ8vAi8hCsYbNjP++tJGA5W0VEQakcYJIMKNZDZDgvzQJmoqZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRst4-0008Hm-00; Tue, 26 May 2026 16:36:06 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 43B80C0154; Tue, 26 May 2026 16:35:05 +0200 (CEST)
Date: Tue, 26 May 2026 16:35:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Manuel Lauss <manuel.lauss@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Message-ID: <ahWvmVYErSQTBPyV@alpha.franken.de>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
 <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
 <CAMRc=Md6=Zn0CDt9=UsFWtT7FesefKEKk3jrvhhKTL9zPFPL1Q@mail.gmail.com>
 <agzOh-YwnE7Utr0R@alpha.franken.de>
 <CAMRc=Mcw4ASoKpJmrjPKOqzLkbc6oLuFibd8E130Ehj1sAeSpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcw4ASoKpJmrjPKOqzLkbc6oLuFibd8E130Ehj1sAeSpA@mail.gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14760-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.959];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,franken.de:email]
X-Rspamd-Queue-Id: B60BD5D7E12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:07:11AM +0200, Bartosz Golaszewski wrote:
> On Tue, May 19, 2026 at 11:15 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, May 19, 2026 at 01:52:16PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, May 5, 2026 at 3:31 PM Manuel Lauss <manuel.lauss@gmail.com> wrote:
> > > >
> > > > Hello Bartosz,
> > > >
> > > > On Tue, May 5, 2026 at 11:09 AM Bartosz Golaszewski
> > > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > > > >
> > > > > This series of patches updates board previously converted to use static
> > > > > device properties/software nodes to attach and use nodes attached to the
> > > > > respective gpiochip devices rather than simply defining unattached
> > > > > software nodes with matching name. This is a requirement of newer
> > > > > gpiolib code. Note that there is currently a workaround preserving the
> > > > > lookup based on the software node name, but it will be removed soon.
> > > > >
> > > > > The additional 4 patches convert the remaining 2 boards to use software
> > > > > nodes as well and fix some build warnings.
> > > >
> > > > I have run-tested this on the DB1300, without any issues.
> > > > Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
> > > >
> > > > Thanks a lot!
> > > >       Manuel
> > >
> > > Hi Thomas!
> > >
> > > Can you please queue these for v7.2?
> >
> > sure, will do.
> >
> 
> While at it, can you also queue these?
> 
> https://lore.kernel.org/all/20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com/
> https://lore.kernel.org/all/20260430112410.65986-1-bartosz.golaszewski@oss.qualcomm.com/

I've them now in my mips-next tree, but the alchmey series doesn't build
with gcc 10.2.1:

/local/tbogendoerfer/korg/linux/arch/mips/alchemy/board-mtx1.c:88:47: error: initializer element is not constant
   88 |  .properties = (const struct property_entry[]){
      |                                               ^

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

