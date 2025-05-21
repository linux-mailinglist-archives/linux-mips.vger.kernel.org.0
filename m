Return-Path: <linux-mips+bounces-9050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9BABEE78
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 10:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519154E314A
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 08:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDB52367B4;
	Wed, 21 May 2025 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwNh92Fv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6478C9C
	for <linux-mips@vger.kernel.org>; Wed, 21 May 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817261; cv=none; b=si67ESPSL6kmuLnTPALHH3rPATDipxlINGTX/kx9qMKawzeZVAj55VrBwwWL75ax3oafzIzxTG2vnxHwOTZINqH48SLuzVPx78L1sEI/Z1s2Z9STW4cuTs3pjFfsi6uIxzBvqgH9gi8c10R9Djgwg4t4HFfKMxVXFWH6O4qTdNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817261; c=relaxed/simple;
	bh=5pWidrI91VR2qRLV4zIY0l69FQO4+WbAwn+z5eok1PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcNveKNY5+YwNjcsycf0De+2klfArcsYrEetQwRNkDai2MWnqtctftaQ37f/uLeHJETGoeOPEuvP2JgL1oDFbkOI3IuYgauDyHnTRwDAmgD4hEYE7AveNg7aEkX/ySHe+k4tD4T9x52THFiWMvCAztyUKoHZLR3nF0rcQLbX1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwNh92Fv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747817260; x=1779353260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pWidrI91VR2qRLV4zIY0l69FQO4+WbAwn+z5eok1PY=;
  b=mwNh92FvmVwA7AO4Qmy4oO6yoD088PLFSP3l0QPUbZTD9FFDIgxcG0Wr
   vsuzaqNVbDTeVsFJxRiWpiL/YpZwEEAkrIWO/zUA7fa+PO9Qlr2AL1UtT
   MI9E7N9Rk5QQjgxLd3lhxHGhStxAbZU4hE8i+ACaw4kDq8DVML7eUjP2v
   ucNjJ7ivOQC2Q4zT5bvwzkZ8qzUM6om9SKhkBxpGfUKuT5ZW1H64d+RMG
   KvhTdKf96HRSDf4C8vqG303b/3clTNEAYhBN5V7Q+c0IkjijwegwOpAxM
   +LJbCsp8Btn3GNGvTRYbRmeCTV0YjZg7r68LIKBh10lQrtc9NtcnzHVQ4
   Q==;
X-CSE-ConnectionGUID: AtaAPU7LSGOn7z+VqCTM9g==
X-CSE-MsgGUID: 8KEl4SHxTMCjngW/rO7mtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60018135"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60018135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:47:39 -0700
X-CSE-ConnectionGUID: PNL9qUxVRCSEx4+vSZlkKQ==
X-CSE-MsgGUID: n7MkH5oJScCPOr580EtBOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170840633"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 01:47:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHf6t-000O3c-15;
	Wed, 21 May 2025 08:47:35 +0000
Date: Wed, 21 May 2025 16:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 16/19] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202505211654.CBdIsoTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 [16/19] mips: Add EcoNet MIPS platform support
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250521/202505211654.CBdIsoTq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505211654.CBdIsoTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211654.CBdIsoTq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

