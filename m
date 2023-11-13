Return-Path: <linux-mips+bounces-46-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3B47EA4B6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 21:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5AC2280EE0
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 20:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1EC250EE;
	Mon, 13 Nov 2023 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725A24A0A
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 20:23:36 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6653D10D0
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:23:34 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r2dT1-0006KQ-00; Mon, 13 Nov 2023 21:23:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AE1B0C0136; Mon, 13 Nov 2023 21:23:03 +0100 (CET)
Date: Mon, 13 Nov 2023 21:23:03 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	kumba@gentoo.org
Subject: Re: sgi/ip27 REPLICATE_KTEXT: Any user?
Message-ID: <ZVKFpzVDaLDZQjqa@alpha.franken.de>
References: <b84cf882-1d72-49a0-a7d4-cf15e9478216@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b84cf882-1d72-49a0-a7d4-cf15e9478216@app.fastmail.com>

On Sat, Nov 11, 2023 at 12:07:25PM +0000, Jiaxun Yang wrote:
> I'm fairly familiar with Loongson64 and I'll take care of it, for
> IP27 I have limited knowledge on it, I'm confident with dealing
> general NUMA stuff, but REPLICATE_KTEXT seems a little bit cursed
> for me.
> 
> I had a glance on it and I think this feature won't work on modern
> kernel anyway. Nowadays, we have many fancy stuff like uasm and
> static key which will modify kernel text at runtime. 
> 
> So I just wonder if there is any remaining user on this feature?

yes, it's broken at the moment, but usefull for IP27 (and IP35)

> Are we safe to drop it?

no, please leave alone.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

