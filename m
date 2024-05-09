Return-Path: <linux-mips+bounces-3188-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F598C0EBF
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 13:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593E31F21F48
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB5B130E34;
	Thu,  9 May 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyA2yVOw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2A130E46;
	Thu,  9 May 2024 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715253307; cv=none; b=noawz/jd0zcWpXLtHQXws0uaA8pCu5nQ6dRHrEYcDG/k2t0B2zlqz/Yk6/Tjbd0usF0aQI+4oZvbQteQ/Q/NXBm7qAT1K0XsS+AD4c2oyn+i0OVoT0p5n5DikP2ti8inL0jaaMsGAy6g00r3OMmjEltSuDLdcwSwihW9LTYtqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715253307; c=relaxed/simple;
	bh=vXsFMRaxSZwNwrtFNURLPwY0cD8dWAmv9PX27I1oIPQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNzF3x0uc3SrO71hm3geg2DDWlbNibll49+Cg4BP0xi34BzhENvI9FeKyCYa5uk3IebB3CqgpeUaKgmdMZH/gWq8RPxvwlnmS93VyO4w8QYlnHvbQvvDTDx0tdA0KbVofzuSdqcYBWT1ioN+i7LCsn6n9MUBcJ7ho6rASMFHYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyA2yVOw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso1078793f8f.1;
        Thu, 09 May 2024 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715253304; x=1715858104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IJB+OgvYLYogQhbVxq5DLy1Lyjt+NholKOBiVxc0zRI=;
        b=lyA2yVOwOWzGWUNIoK7J65jieH6XYi3xE7atmFVJj6GTtof3/nJ2gBWfVuQz6AT+aZ
         Sy/fPJYfExeNRvpAMWxTFby7tqbcw36dCjv2+ZKgvtBO6vexlRv/wzjdeSBJozEmlAWF
         9LMuOtLGxPQe2OECy0eHmx4pItXdjpXBE4PVF3tq7v2Rl+QKar+RHv++TKXDAB5oHaZ1
         lY8+8GDG1yhAd5vO6VmxBZySYjD5fzSeLidFW9+c57QU5uR53T7ubnPWWLRDM+oqmVYQ
         cgKa/U/INlQTznMIoiUJrV5NlYjyXSRIpuovpALUmH+v8V7qaCvWichxNXIPFHM7kDUO
         nNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715253304; x=1715858104;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJB+OgvYLYogQhbVxq5DLy1Lyjt+NholKOBiVxc0zRI=;
        b=E/3zgIkBcd3slxgwAgHFPSWscZq2rW9+0+w9BQ/PgCTWDMBCLjy7qWM0OZp63YwJkS
         Ib4w+kMsK5JRQib8hAtfZLTxRlOUi2bB7kv+yt3702/Cr3pN8YamuZtL9isNqrhQ968U
         2yoQuI7b5kE3eoQ9lujuuFMeNYdTdRHSO/gb7FDJfb1hf3sPSwGBDa+WNS2/uddetqc9
         CWvmSB+Rnhnfrpf/Sq79LDPQWs8Jk5F4oQo8bhzOGn7gh48wkvKkd+4wQegfZVVA7sUu
         NtksikkRnZdkotKTcpMxRuMQYWP1XDtfEVVHiK5B3mgpruYTq/Rj/64OpHjLhS8Pg0zs
         58qA==
X-Forwarded-Encrypted: i=1; AJvYcCXJyu0BkXlKV83+qLPcSUvVcqze4fqOnl7cYrZebUvuC8fmSZjQw9V2Z2vdC+NKcC3Y3Dqr3Jl6d6AHM69wqxXEtSXvhGbFpgn9x7pYx381UOJ7ASMgbfHN7rutOVbEeaVnCaB02Lun2GOkz2Tn6/4HDFmTNvcxAHAhU2vElQQ0hQQyEHM=
X-Gm-Message-State: AOJu0YwNE72W2nWgAWedxxd5zSr2uDd/p8ep//re2Dtsdgg3wLF9tMq9
	31cs3clHBgzIqvis3VHgsmGJN9qqtywnLLO8oYNZWFyFWUKDvaKd
X-Google-Smtp-Source: AGHT+IHHCRkykSFXuu6ipQb2TuDdXJTI3AAL4s9XQ0bI3eoTF9YXQdmpGXJ2MLVDIqVGbi11gFDoDg==
X-Received: by 2002:adf:fe8a:0:b0:34c:fd92:3359 with SMTP id ffacd0b85a97d-350185d57e7mr2016967f8f.21.1715253303584;
        Thu, 09 May 2024 04:15:03 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfd3sm1426846f8f.84.2024.05.09.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 04:15:03 -0700 (PDT)
Message-ID: <663cb037.5d0a0220.41af4.3328@mx.google.com>
X-Google-Original-Message-ID: <ZjywNBzF0EwuS4MM@Ansuel-XPS.>
Date: Thu, 9 May 2024 13:15:00 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
References: <20240503212139.5811-3-ansuelsmth@gmail.com>
 <202405090546.iqx9FAqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405090546.iqx9FAqu-lkp@intel.com>

On Thu, May 09, 2024 at 07:13:16AM +0800, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.9-rc7 next-20240508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/mips-bmips-BCM6358-make-sure-CBR-is-correctly-set/20240504-052513
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20240503212139.5811-3-ansuelsmth%40gmail.com
> patch subject: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
> config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405090546.iqx9FAqu-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_ebase_setup':
> >> smp-bmips.c:(.text+0x114): undefined reference to `bmips_cbr_addr'
> >> mips-linux-ld: smp-bmips.c:(.text+0x118): undefined reference to `bmips_cbr_addr'
>    mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_cpu_setup':
>    smp-bmips.c:(.text+0x1a4): undefined reference to `bmips_cbr_addr'
>    mips-linux-ld: smp-bmips.c:(.text+0x1b4): undefined reference to `bmips_cbr_addr'
>

This is caused by legacy brcm47xx and brcm63xx target. v4 will have this
fixed (and I will drop the ACK since I moved code around)

-- 
	Ansuel

