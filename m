Return-Path: <linux-mips+bounces-128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA07F284C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 10:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F3E281D0E
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 09:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA330FB2;
	Tue, 21 Nov 2023 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2040F9;
	Tue, 21 Nov 2023 01:02:22 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r5MeC-00071D-00; Tue, 21 Nov 2023 10:02:20 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 97888C0136; Tue, 21 Nov 2023 09:07:32 +0100 (CET)
Date: Tue, 21 Nov 2023 09:07:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linux-mips@vger.kernel.org, john@phrozen.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of the Ralink
 architecture
Message-ID: <ZVxlRE0tcAv1iaoA@alpha.franken.de>
References: <20231022090633.792831-1-sergio.paracuellos@gmail.com>
 <513bc341-25b8-5a57-d760-861a3e88a4a1@linaro.org>
 <CAMhs-H8A0p=nFSnU9pRn=rTC_=CH6jXFQdYgZdimFNq9+dVqSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H8A0p=nFSnU9pRn=rTC_=CH6jXFQdYgZdimFNq9+dVqSw@mail.gmail.com>

On Mon, Nov 20, 2023 at 08:59:25PM +0100, Sergio Paracuellos wrote:
> On Wed, Oct 25, 2023 at 2:58 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 22/10/23 11:06, Sergio Paracuellos wrote:
> > > Its been a while since I am making contributions to this architecture.
> > > Hence add myself as maintainer.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > > Hi John, if you are not ok with this please let me know. In other case
> > > please ack this patch. I can add myself as Reviewer if you prefer to
> > > maintain alone this.
> > >
> > > Thanks in advance for your time!
> > >
> > > Best regards,
> > >      Sergio Paracuellos
> > >
> > >   MAINTAINERS | 1 +
> > >   1 file changed, 1 insertion(+)
> >
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >
> 
> Thomas, can you take this patch through the mips tree?

sure

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

