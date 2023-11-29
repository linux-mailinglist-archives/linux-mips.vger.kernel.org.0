Return-Path: <linux-mips+bounces-400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D237FE40D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 00:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DBBF1C20A35
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 23:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B253B1B2;
	Wed, 29 Nov 2023 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YDok8f25"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AF2B9D1;
	Wed, 29 Nov 2023 23:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96778C433C7;
	Wed, 29 Nov 2023 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701299430;
	bh=N/H0WI8OOAZg5IsWZvaQQHP/VpfSznz5JRrpi05DQq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YDok8f2518AVgQG+4UbU1jDVslt6EdxIDQcEA9vP/gGtXvaGokTj3clVuawA/cGXw
	 4aqQWtzWKem2vtw5Ub1sBn+3QvIq/SfJ6ogTJQYOko4tZoMau1Nb4B9Y/lpe+yocnu
	 PEvzSJk+c3KNAvWZP7c0XdWMiPiaqvlDul7kElLw=
Date: Wed, 29 Nov 2023 15:10:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Stephen Rothwell" <sfr@rothwell.id.au>, linux-next
 <linux-next@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: linux-next: lots of errors/warnings from the
 -Werror=missing-prototypes addition
Message-Id: <20231129151030.24b807f1d2b43be301a533b7@linux-foundation.org>
In-Reply-To: <ebb5b1a2-ed27-4a77-b62b-1d3f19bddd85@app.fastmail.com>
References: <20231130075838.05e5bc9b@oak>
	<20231129131003.d2c1078847c3865c1ac2dfd5@linux-foundation.org>
	<ebb5b1a2-ed27-4a77-b62b-1d3f19bddd85@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 23:51:04 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:

> I did all my testing with CONFIG_WERROR force-enabled, so
> the bit I missed here is that at least three architectures
> that are missing fixes also set -Werror: mips, sparc and alpha.
> 
> How about adding a patch to no longer force -Werror for
> these?

These architectures are doing it wrong, aren't they?  They should be
using the CONFIG_WERROR infrastructure rather than hard-coding it?  If
so then sure, a standalone patch to clean that up sounds sounds
appropriate.  I guess it should precede "Makefile.extrawarn: turn on
missing-prototypes globally".

