Return-Path: <linux-mips+bounces-9602-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A7AF0FBB
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 11:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FCBC4A624A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 09:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F9D241679;
	Wed,  2 Jul 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHa0mXnd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20B24113C;
	Wed,  2 Jul 2025 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447922; cv=none; b=B8pSo/o0pqRiuklC75K+w+dfOn+kv74LASrnuv0WpbWPFEaVycicMWfbilR09S44IaD/PjEqG74bV62ke2WDVWVxSbHesvy57iJ5Tedmj0/P8nDjtqZ3obTeesywySd96t/WTM1uhT+ws56HYlShF80t9Kut9IQAMcG5f63TIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447922; c=relaxed/simple;
	bh=YgIsYbsQFBijlbHTYsgXc9tCHNmRLzh8Vr+Nl8ZnQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxJ478Vskn/ZuAM/zgH0PYkg4VXZkJUkHRMy5GKmCvmBsDmfs1eXxPCkoTpun93e37P7mnUmo9KmJmaVSylsGkPw2OLdEMWiYekjTUOihxDT3uA4/TUXYhu/bjmM5fy5971B7I0ciTKdRqun4t2Y4CLuHHMY1JvsIasrYPHq+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHa0mXnd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751447921; x=1782983921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgIsYbsQFBijlbHTYsgXc9tCHNmRLzh8Vr+Nl8ZnQ3Y=;
  b=NHa0mXndNPsqjlQrfnWjAXFl0IMSNhz84cndMG2tSKjw+euM/Oyp9vFa
   ixo1LLXfEIm9HtzAE1ubpLWvHg4bv8TUeMSD2U/GUWQ/hk7P85yndqVcX
   wfl/BQmx2E2ZfEEb+QW9hChTSpulkYFuC6bbRN4nqmR37f/MkJIe3m/Ue
   PXccaMN8oeLtYrXgITAR3jwszyIoaJ2jvPktZqBfosvEPTHXlbS3cKATq
   dxtPq+yy2idujdWfTJFXnHEYP4bD5xDHIvYj2QfdUFVWtw89we8XjVo+I
   XMbazlG4XKfyLikroo4TRYHVUzQ1PDXCYtNISQus8pwnJcp6gGosfUCtu
   Q==;
X-CSE-ConnectionGUID: +itLhkHVSiqOACp35zLYFQ==
X-CSE-MsgGUID: SEjAjsBxRdWyilKroVWb2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427969"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64427969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:18:39 -0700
X-CSE-ConnectionGUID: vxd1XndcT3OoMKfVHJDRig==
X-CSE-MsgGUID: gpP80ZaVRkCf3Rmd/W+dKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159538616"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:18:36 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWtbu-0000RX-0P;
	Wed, 02 Jul 2025 09:18:34 +0000
Date: Wed, 2 Jul 2025 17:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <202507021740.qURVV9D8-lkp@intel.com>
References: <20250701225355.2977294-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701225355.2977294-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Create-a-trivial-GPIO-schema/20250702-065536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250701225355.2977294-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507021740.qURVV9D8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021740.qURVV9D8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/lp3943.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
>> Warning: Documentation/devicetree/bindings/powerpc/nintendo/wii.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

