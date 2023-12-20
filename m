Return-Path: <linux-mips+bounces-798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1981A8AD
	for <lists+linux-mips@lfdr.de>; Wed, 20 Dec 2023 23:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BA21C21EB4
	for <lists+linux-mips@lfdr.de>; Wed, 20 Dec 2023 22:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99684495DA;
	Wed, 20 Dec 2023 22:02:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB541495CE;
	Wed, 20 Dec 2023 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rG4Ro-0001hv-00; Wed, 20 Dec 2023 22:49:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 74424C028A; Wed, 20 Dec 2023 22:18:14 +0100 (CET)
Date: Wed, 20 Dec 2023 22:18:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] MIPS: Unify low-level debugging functionalities
Message-ID: <ZYNaFhFp/+q+/Z0Z@alpha.franken.de>
References: <20231029-mips_debug_ll-v1-0-d7a491e8c278@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029-mips_debug_ll-v1-0-d7a491e8c278@flygoat.com>

On Sun, Oct 29, 2023 at 02:53:01AM +0000, Jiaxun Yang wrote:
> The plan is to elimiate platform specific early_printk and
> cps-vec-ns16550 by debug_ll and earlycon.

https://xkcd.com/927/ ?

sorry I don't think that just another new function is good approach.
Doing this will end up with another method for early debugging and
all other will stay.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

