Return-Path: <linux-mips+bounces-132-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6D7F2D66
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 13:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78B82B2154F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7504A9B4;
	Tue, 21 Nov 2023 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A708138;
	Tue, 21 Nov 2023 04:39:50 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r5Q2f-0001Uc-00; Tue, 21 Nov 2023 13:39:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 48821C0136; Tue, 21 Nov 2023 13:38:26 +0100 (CET)
Date: Tue, 21 Nov 2023 13:38:26 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org, YunQiang Su <syq@debian.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: process: Remove lazy context flags for new kernel
 thread
Message-ID: <ZVykwhGE/aqjcpaK@alpha.franken.de>
References: <20231026111715.1281728-1-jiaxun.yang@flygoat.com>
 <ZTvQGs/lEpizUFLh@aurel32.net>
 <ZVjaDTcjNpD3m0cC@aurel32.net>
 <ZVuuqAUJ7f2ELIYW@alpha.franken.de>
 <c9e2daa2-65a8-445e-bace-ab750f04411a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9e2daa2-65a8-445e-bace-ab750f04411a@app.fastmail.com>

On Tue, Nov 21, 2023 at 12:27:11PM +0000, Jiaxun Yang wrote:
> > I don't like the patch doing too much code restructing. I can't
> To reproduce, you can just install Debian sid and build kitinerary with

I found an io_uring test program, which triggers it. Now my loongson3
machine needs pressing reset in a remote location... is there a way
to configure it to start automatically after power-off/power-on ?

> sbuild. However, it seems like loongson3_defconfig won't expose this
> problem, you'll have to build kernel with Debian's config.

CONFIG_IO_URING=y

that's the needed config option.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

