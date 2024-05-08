Return-Path: <linux-mips+bounces-3166-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179678BFD46
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 14:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7CB1C20CD6
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 12:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D759942055;
	Wed,  8 May 2024 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVuDMYxI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B774347B6;
	Wed,  8 May 2024 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715171858; cv=none; b=C2e8VJqZITpGdcS9oZJ8w1VsQrqIiMdH9LIQWrbpfRhv6RjWyaa611PxDjsvBxvqDBGmYgieCfWi28MCYaqR6s3zEZIsCyyezCK2k3eDVDwCnfSmpvkyNcMmtxJdMDMYh/8bdba/t2nDhrKhfClGw7u41Pge9VJrKstNnvd5GR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715171858; c=relaxed/simple;
	bh=cAz7HeJbFspsZFZ1DAYm8MdRx4JYFVuGaZU2/nEtWSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3uatjmnBs5N/o44CSyLBQEUsXepmq3lAOjLTQePvISbfnGudIPUzihe+339luIXgQR2RLQYlAHHJgkJgiSpgGjDfvXhCunlCi3sost8LDsvBvN3tGHWaRYDZ1ljQz57uTiECfTm3glm1AmGJyJDOabLE2Er9+jubj3eavlx/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVuDMYxI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f300b318cso5068490e87.3;
        Wed, 08 May 2024 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715171855; x=1715776655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i58eGKPvYNQTQcyeap/7W0ADrn9Va3j9vHO5Ufznw58=;
        b=fVuDMYxIfgSgSsxnBwdSAog3UeLFFOUY36lksdFcyybPUCbXi6q7A2TfG78WyElM29
         iVwaTnJKGSdtt51DCZFAEqWFUd9VPHA+41OqaHdMoZr3VRCFlmZHTS38bC/4W2e/lKnS
         /daTZc6XY4We4nTZElyehmPL47waAww/oQ47fw4u3YqvefPHDs+WOvhbwxJwU0oirZrr
         mWA7eRCdo0Dyt7yLYErgXufCMQsuS55erUEW0bWKwZJM3RqR34F4VhXeAKrpAe04FL8p
         XA1RwhcLXMHjKXzWSwEOUJZ1initQTpB1EbTKNj6AyIk/3d0wf/zS6I5anGdJ6ew2KNU
         Qswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171855; x=1715776655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i58eGKPvYNQTQcyeap/7W0ADrn9Va3j9vHO5Ufznw58=;
        b=V1v0PamH0EZlIQ8lpZYSO4q4n6s9mDFgYOxmtI3w1Z4lwwCeWcB56oFIsfIgA6UN4i
         AW1p5+eIrG13BveDUdLIXIDZRcf+KhRkuTsBlfBkII8E0SWKGoPe7VJHgZAoE4Omv01h
         L/JJHKm/NQJVOlj35o0cYHT5rJX7AEYFhuCLWR83J4eQVOKcDBQJOgcwnRUJJIqIo2Yn
         osRVzlzuRwmkOR0idnPVXDofpEqHfjNSZ4E3t5QNGC0P5v1JOnIXsH/+x8J9PdWMMIV+
         nUZle008w4Pz4+9K2oSLhu5S2CUrhlOkkLP2fzbUdyYEmvPiorWhy/gAZnPKfM+MzVEz
         VfNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjQih1N0gDkgLwoVkMFJSaXwvJMtu2MGJE7sQuSfmI03ALToSH01uP55UO92PYN8HH0aCmfAVxTkLE6Fg2kFWdP6uUXoC+TP0s7mvUYoOhlIUjJdhSEVOuzFC7L1Ozn9Nnj+gygbxz+V287oKvUOA/Z7AAyCdOX4/XmPP5+THtX1Y3fP0=
X-Gm-Message-State: AOJu0YwTPevSSDI8VHgbDlxqAYyfAC7qOEn5KV3F0zxFlxLqGi+h3ztR
	RJxUhfqMwafqp+M8bkKTGvNXe2T1fnHx4i+mDhZ4npHSJwNZUQLHQo66pw==
X-Google-Smtp-Source: AGHT+IESdzI9ECXTCgEWOcIfTwT0hKXRiT5PTOUn7yNGACujM0l6NidLseL3uzfgExjDFynctwp+jA==
X-Received: by 2002:ac2:4a7a:0:b0:51d:605e:c1e0 with SMTP id 2adb3069b0e04-5217c5664d4mr1346867e87.19.1715171855101;
        Wed, 08 May 2024 05:37:35 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id b26-20020a056512025a00b0051f026412b5sm2514455lfo.141.2024.05.08.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:37:34 -0700 (PDT)
Date: Wed, 8 May 2024 15:37:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] MIPS: cm: Probe GCR address from devicetree
Message-ID: <zy2p2ebyjmuaj6fv2qhglljnjz2x4jmb5d7rkwipu6rn5rrxnc@2tavfilxs7ie>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>

Hi Jiaxun

On Tue, May 07, 2024 at 10:01:48AM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This series enabled mips-cm code to probe GCR address from devicetree.
> 
> This feature has been implemented in MIPS's out-of-tree kernel for
> a while, and MIPS's u-boot fork on boston will generate required
> "mti,mips-cm" node as well.

Thank you very much for the series. This work has been scheduled in my
TODO list for years. I could have done it earlier but a simple at the
first glance change turned to be tricky. The main concern was the
stage at what CM was probed. I was afraid to break things by changing
the order of the CM-base address getting. Let's discuss this matter in
the respective patch. It might get to be I was wrong to worry.

-Serge(y)

> 
> Please review.
> Thanks
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Jiaxun Yang (5):
>       MIPS: generic: Do __dt_setup_arch in prom_init
>       MIPS: cm: Prefix probe functions with __init
>       MIPS: Move mips_cm_probe after prom_init
>       dt-bindings: mips: Document mti,mips-cm
>       MIPS: cm: Probe GCR address from DeviceTree
> 
>  .../devicetree/bindings/mips/mips-cm.yaml          | 37 ++++++++++++
>  arch/mips/generic/init.c                           |  9 ++-
>  arch/mips/include/asm/mips-cm.h                    |  4 +-
>  arch/mips/kernel/mips-cm.c                         | 66 ++++++++++++++++++----
>  arch/mips/kernel/setup.c                           |  2 +-
>  5 files changed, 100 insertions(+), 18 deletions(-)
> ---
> base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
> change-id: 20240506-cm_probe-0c667c8b63bf
> 
> Best regards,
> -- 
> Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> 

