Return-Path: <linux-mips+bounces-4769-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2094989C
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 21:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE401F22C57
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 19:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8A13C677;
	Tue,  6 Aug 2024 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEwbl69g"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A449B770E8;
	Tue,  6 Aug 2024 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722973799; cv=none; b=rtJX4v9ggZBnLemIgfHRIpdwIK3i/rk63LID3h1+T3KRGmCE6bJoH3SwElRe/wWybJ1rYZO8IifyRJY8ACwVulEJBC3tU4VwtcZ5WMSn+WUei+9TLKr1IuitF3BLoy0iqwVWWW9YYmlSP1zxfZ0zn+OyyGpypXayaNewLLB8uDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722973799; c=relaxed/simple;
	bh=B/vP9wN2b0Lzujq46mPPrpNnbTESZoPBqKI5lHHsrEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrXH1DDQb/Oe2Zt9b4khaawe0TWyk6Ud1TdcuvxQf4td+ff/H29tr1+Gf9k7/4k8aYvhMU3bUi/iGdSfKnZNB6C+klExJMjLJ/0WOi+TmiYDjUtxdZZPwvpH/Q5jrgAHQmJSTIyvm3RRWPuz+E0XzgEeZ9WzAzl3BahuAu/O0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEwbl69g; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so1304422e87.2;
        Tue, 06 Aug 2024 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722973796; x=1723578596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3BIPnyjPKBcltoWwn+jJdksE5JCpEOSMNHCDp8ur6XA=;
        b=MEwbl69gvKvhOkeYfhHFoaKp1fUEtiGpV6oAHGbViQmR5deGRA2VNTkVanSGyDSZBn
         XsIHPRi07hkUQ+lYTbwXsFdutW4hBXwlX46kKB9rZJ+7iEAty2rq0KuyQgEtROsVA2Kw
         2HgFp/ZCFz5YVChT6RFAnUTxIv+mydBicaDtwk3GM6pVYtzfJ/QOceJdzwXX7TLGjY6d
         JovSylZb0xLLqLr4WKVTc8jRi+nxKX2M22xh8G3TmybCq3Y1MhRI6JGdrv1+GCVsXFxq
         H6xxYQKlQTQMh8jXUVq0wISmLQDu/lxTQrk+ZJCpinwUi++PCJkQ6kalj3CKOFfz00pB
         E96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722973796; x=1723578596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BIPnyjPKBcltoWwn+jJdksE5JCpEOSMNHCDp8ur6XA=;
        b=Bk3kOITlfkjMpwdeLz8VFNoFMsJdGfRs0jKj+22h795SdxfWDNLvZM/5WsdavKpEP0
         O+A6Y/gMMO7LrDJvd7jgPAsJYVyS4fS99zvd83gREOs2c4qWK8vX/Fvbn0uXnNjyFeHJ
         UhmKkynu9BZylS6S9eoAT3N90zJES4gNGPA8Lx16nJAojjbssXuY+DO7q80PoEMSNBil
         Cx5qXh/ceo68fy6rO4BWy6DIM/BG6dQk/yj0IuwUokuVN2hCbkAqu4doq9Lau++VZu2n
         t4zCUqSFdGm6qjC6xulQ+bYdZoO1HDOetuTlCQRbLFurKoY886AzrhrzLYfYmvBKv8oE
         DfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3dU3HwfY1/Bwwd+iS6KQynyuhp82EzujNTWWGppVi3mLcoA0quR3C8ak5YYuZlvrgtHqxlyai2MLIuXb5l8ohiUlHibbApKBofqGwtLioN1SRHY+6WE0kVVzWnwjAwwGLZRFs9tCf49HagUAxLED+eYW8CeGD3+mRtik1DvBtaXtQUp0=
X-Gm-Message-State: AOJu0YwNULfhKyrCW0vWreuoT4sK7X/WpoPEY+jhf8JxznYb3ue6CL9G
	QPFr3erh5a+fr3KeUZfuRkCFkdRNebcvTHyVtB8qeqTfOCyroMGC
X-Google-Smtp-Source: AGHT+IGK2s8feMRbvkUaD4kViF7Q3kQxUMru3SGpK7yJIQ4CcspUgrPUj5ul3TWc//iGjdUBDK6Vuw==
X-Received: by 2002:ac2:5bc5:0:b0:530:c239:6fad with SMTP id 2adb3069b0e04-530d07319e6mr4165367e87.0.1722973795304;
        Tue, 06 Aug 2024 12:49:55 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba35aaasm1558385e87.230.2024.08.06.12.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 12:49:54 -0700 (PDT)
Date: Tue, 6 Aug 2024 22:49:52 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Message-ID: <3wemwdkev7pafyfu3yxhpvvpqaplhlejbzxtmahcarrnoeelzr@747sgyl63kwj>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>

Hi Jiaxun

On Wed, Jun 12, 2024 at 11:08:52AM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This series enabled mips-cm code to probe GCR address from devicetree.
> 
> This feature has been implemented in MIPS's out-of-tree kernel for
> a while, and MIPS's u-boot fork on boston will generate required
> "mti,mips-cm" node as well.
> 
> Please review.
> Thanks

Got this tested on my P5600-based SoC implemented as non-generic
platform. Alas the system hangs up on the early boot-up stage with no
even a single char printed to the console. I'll be able to get back to
the problem debugging on the next week.

-Serge(y)

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix probe order on malta (Serge)
> - dt binding improvements (Conor)
> - Build warning fix
> - Link to v1: https://lore.kernel.org/r/20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com
> 
> ---
> Jiaxun Yang (6):
>       MIPS: generic: Do __dt_setup_arch in prom_init
>       MIPS: malta: Move SMP initialisation to device_tree_init
>       MIPS: cm: Prefix probe functions with __init
>       MIPS: Move mips_cm_probe after prom_init
>       dt-bindings: mips: Document mti,mips-cm
>       MIPS: cm: Probe GCR address from DeviceTree
> 
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++
>  arch/mips/generic/init.c                           |  9 ++-
>  arch/mips/include/asm/mips-cm.h                    |  4 +-
>  arch/mips/kernel/mips-cm.c                         | 69 ++++++++++++++++++----
>  arch/mips/kernel/setup.c                           |  2 +-
>  arch/mips/mti-malta/malta-init.c                   |  8 ++-
>  6 files changed, 111 insertions(+), 19 deletions(-)
> ---
> base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
> change-id: 20240506-cm_probe-0c667c8b63bf
> 
> Best regards,
> -- 
> Jiaxun Yang <jiaxun.yang@flygoat.com>
> 

