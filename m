Return-Path: <linux-mips+bounces-1865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FF86AF04
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 13:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CEB7286C1E
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 12:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855003BBCF;
	Wed, 28 Feb 2024 12:23:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B603BBCA;
	Wed, 28 Feb 2024 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709122991; cv=none; b=f/zX2S/XUOGFrqhz5kI5qIeieGF8uUM+honMLyEMg2ZxiIhn/+JYyklxfLHfPb1Xh7h+53eaVOyDHwiKkz70MHAKTi6mIZJLA7Ghd5s/qPBY6zdadk5BDvnJoKLQJtQjyr9BhjVVjgf4dY5QkFhupjP9KWwIJNJHFIse495MERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709122991; c=relaxed/simple;
	bh=SVtQO8r2yePTphhzLpnImn08AiygW6kzQkY3LEIB1og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvuuKHJEdeu9PTO2whfsYVrYGbEfY/sMLC2ZZX98TnvJnZovdMnuNwO9pziin9+4SrEL9ev3qbBA7VnXSXA37o1As+UtaNdwY6PJ0EQIEgBKr070vZ2shes7Q0pdnvEMuH87fl9sfclF/mp+bHaGHxUGyuIu8duDjoQ1y+DHubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rfIxd-0003al-00; Wed, 28 Feb 2024 13:22:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 81A77C0267; Wed, 28 Feb 2024 12:26:58 +0100 (CET)
Date: Wed, 28 Feb 2024 12:26:58 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: parse_r register name (was: [linux-next:master 9092/10236]
 arch/mips/kernel/mips-mt.c:3207: Error: Unable to parse register name $fp)
Message-ID: <Zd8YgkZYxS1hc9xl@alpha.franken.de>
References: <202402270524.HtRvZbPR-lkp@intel.com>
 <d93079f8-2402-4d06-846b-5375cbeead3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93079f8-2402-4d06-846b-5375cbeead3c@flygoat.com>

On Tue, Feb 27, 2024 at 07:22:24PM +0000, Jiaxun Yang wrote:
> (Top posting for visibility)
> We had a discussion on this issue[1], the conclusion was it's a clang
> misbehavior,
> however, it turns out that GCC is doing the same.
> 
> Do you want to pick that patch?

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

