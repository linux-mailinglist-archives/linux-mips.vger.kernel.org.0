Return-Path: <linux-mips+bounces-9056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E2ABF1CC
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 12:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1EC3BA20B
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 10:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3176C25F795;
	Wed, 21 May 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ejlgr+Ry"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3C25B671;
	Wed, 21 May 2025 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824079; cv=none; b=OUgiWN4JSmSQiPxcNjfZxePZppPtxQrcmDqLE7sD4eBbGb4+k4FrRSDWRW26ax4OjjHBONyoTlFJ7oMILmCUV0cIwx2lGOD7Elh/R7rYgrJBnXnuLhNFYtPEdU/VCYxSn7sZ5ZObOS5slWxPLBoAtgDgFxOo+uIYYHH9U7sNh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824079; c=relaxed/simple;
	bh=Nk2+KANPF/BgPS8S7aM7RxvEJIQEP0hm9XqCd36R04k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skiqUMKMyaOppZdTkeDLfScMp307BMdo/c6sudi5EkmY5Jd8WJtlNtDme22u/2bfIzQt3egqywaBCCLyU/pzYqwlHRSJJfpF6zw0zmlW0DRxDvjnT7QPRQzpMSiluSiUobJHwIC/M+KT+Tpo/qcd54/kwgTL2SNQAzqQeDK34tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ejlgr+Ry; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73B85197AB2;
	Wed, 21 May 2025 12:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747824074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o1TFnGELkG9UAXtbubbM/91RSHqAHcQfQZfaBIl9xc4=;
	b=ejlgr+RyuCuImwXx+ddV47BbFrKf6puX0L3fuervHjGhpb/k39vt1O+De0MnuGGUEPyRbU
	4v3xP802r9WsKh3OJSsiP4qhENv6gi66pC33qVdwf5/BV2NQouBPMzLWz4xEPaYWVmfXm6
	cvLt4DB/k56yayL/LnehTsufqEn7BgrmS1d/H3I+yDmKmo0vjMKAqYxWErMNDTuG3E4s0O
	7PNVF2QE1zG6y1c9ix2O+sJMv++IMwhCXnRRjXiVBZrfuatl0XrD94MVl0J7MX4qfcYNGT
	ChiOJRj3gZ68TTS8gTDKvOmB0BwlVifPv5+ek7WB/dBpvuMV6TIRxhWJ+LpqRw==
Message-ID: <c1914730-62ba-4600-a58b-feefd2f65e9d@cjdns.fr>
Date: Wed, 21 May 2025 12:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [mips-linux:mips-next 19/19] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 linux-doc@vger.kernel.org
References: <202505201832.NNOJ4E78-lkp@intel.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <202505201832.NNOJ4E78-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 20/05/2025 12:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
> head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
> commit: faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7 [19/19] MAINTAINERS: Add entry for newly added EcoNet platform.
> reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201832.NNOJ4E78-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505201832.NNOJ4E78-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>     Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>     Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>     Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>     Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

AFAICT no action needed as this will be resolved when trees are merged.

Thanks,

Caleb


>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>     Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
>     make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
>     make[1]: *** [Makefile:1801: htmldocs] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
>

