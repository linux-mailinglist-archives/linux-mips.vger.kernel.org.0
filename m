Return-Path: <linux-mips+bounces-2245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406787967C
	for <lists+linux-mips@lfdr.de>; Tue, 12 Mar 2024 15:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4BD22810D7
	for <lists+linux-mips@lfdr.de>; Tue, 12 Mar 2024 14:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6C67B3E7;
	Tue, 12 Mar 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6+SPzNt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAC7B3F5
	for <linux-mips@vger.kernel.org>; Tue, 12 Mar 2024 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254095; cv=none; b=h5PE8F161+7RIG27uX+9sPJKyvzVTP0pqmJ0NUDuX9U2MDafR+9xPgJ7Rqil1IvY+JX1OhF7MD/jxxe2aM90bvJDPHK9poBPbs2YtpG3S5P6//JzhtYApV8gOUdZj7fGbnCXBDKcfMPmzMCzyZzz+8MT+oQSnK49b1zBmPkKcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254095; c=relaxed/simple;
	bh=E3DAV2ptqUDrKApNCT+XdDq8H+3SuwMe2QpcmchGQq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfCdJ2YE0Jmt4aOPbPoU9jN9BDCsHteEqsqTzsPFP2RIJjX6BtEwMkcDFbbtTjWPrKCRBTNxK/jvszmRWTWfHG6BeWnUE4oKV8rRHbw6cNhkb9qT17vfGlE2G21rLaQW6/XecAvTNFeyVjkdGKg5IQIWFoxsSMD0ubAHYBxSmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6+SPzNt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710254094; x=1741790094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3DAV2ptqUDrKApNCT+XdDq8H+3SuwMe2QpcmchGQq0=;
  b=Y6+SPzNtBWfgWBspG2BPyUT7dfKdpznuy6Y86S9iYNCOcoq19Rf+4ZgT
   Az6c37gacaJTACAiqRUzLIKpkXjXr8rSbMW0BbXhBPpEIwLvIaQxHbbBR
   SHazO5ayW4o4VlKagJG0oQbIFURlVyGgkcY7mkAmecxcx7yPGrKBC3M+T
   T6rh8FT0pvhyVYl5LhgkDlKqfv4jpUNT36e7keOJh1cvUL+QngsGIi17E
   oZksDn1ageV1YROtQJ1xDcNWhPBPdemTORDq8eRiHUvZoiBw1NhWinEyq
   DuLsKDlvCcugXxWuosnKRRizmvctMV/JMmJqxVJtrd+w4ACTqu9fbidfp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5152857"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5152857"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="914398421"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="914398421"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:34:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rk3DM-0000000Buqy-3gEM;
	Tue, 12 Mar 2024 16:34:48 +0200
Date: Tue, 12 Mar 2024 16:34:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [mips-linux:mips-next 47/56] arch/mips/ralink/timer.c:136:48:
 error: array has incomplete element type 'const struct of_device_id'
Message-ID: <ZfBoCBta1cnguCww@smile.fi.intel.com>
References: <202403120926.hoXbeGnb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403120926.hoXbeGnb-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 12, 2024 at 09:38:38AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
> head:   732932220078f6312f3ef57c17523d3d7f995655
> commit: 5804be0618486f8979208e323188e44f8013a6a3 [47/56] MIPS: ralink: Remove unused of_gpio.h
> config: mips-rt305x_defconfig (https://download.01.org/0day-ci/archive/20240312/202403120926.hoXbeGnb-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120926.hoXbeGnb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403120926.hoXbeGnb-lkp@intel.com/

Fix already had been sent and applied.

-- 
With Best Regards,
Andy Shevchenko



