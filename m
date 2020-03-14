Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB76E1853A0
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2020 02:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgCNBHt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 21:07:49 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45215 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgCNBHs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Mar 2020 21:07:48 -0400
Received: by mail-pl1-f194.google.com with SMTP id b22so5115541pls.12;
        Fri, 13 Mar 2020 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Gvx9Hu5CHDL2kz8sy1w9qMMWhvLKzmdkZ+ff9kTBsQ=;
        b=Ezv+wSzfrAvGngOM/7Wm0cRtUt0odJIu/ck5ZnVoh7jud5b59FUloYYH4++JfDpEUD
         x81UqroT3ZzeWiHISneHzrjDtInpLm83HxBlWeKtS3D4Bqr460uq2L0KeEjBII9yVdtg
         GcsxxXCJhGnUmOk8M8EW3xqoqRKxjLAe/n1TdLXQQdTHTyl9UX2Z27GFKOBOdlczAwlu
         XNZ3OMAUkZbiHGenf4Ixt9h8B47cOs2zFR385gG5PczOW8XGR+5a+ogHFKXL+3GBGUBG
         ETA3DwjNg1qQKWfujbKX+6NG6HVZzeJ5PGYwMRdQIX72rQhHw2QfQk6ZlKqjMAGAsdHw
         OEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Gvx9Hu5CHDL2kz8sy1w9qMMWhvLKzmdkZ+ff9kTBsQ=;
        b=Y+C/Yqd+FgzccT6u5tzG2fkAsmGa/BRTS1gQk4n0f0pPVPkMPh40xvkRrZDP22K7Ae
         zhqtUhuhK0O0Dkbn4VBAlfYzRtx5mU0qmnPGA2iDuY/+Za2xxY63aEtsQpuXNp0YdLVf
         IQwK+BK7Ey6/YrLKgP01ZK0CwXRBQ3NdDWoSkoTQbsNZqMFxuj7oVo6I06eCTe1ivylZ
         Isw/6AkJAGOx4iJLkthNnf+xPDx5H6hQH+VYtPaf5QZfG3SK8Ua2sYf/xvKZ51DEVFAF
         DIN9XDoY7e/QoU0qaxv2w7r80WHt/oqd5nU1Z/g3WA8umH/cB834NrgJZYCAHLriNsF3
         EWRw==
X-Gm-Message-State: ANhLgQ2b1Aq9hmBxafd3uCVjUgVWwpkQjPvK0wZyewjA12molt39ZQsv
        5mqvQ4Q2xK/ROWQY4etV+NE=
X-Google-Smtp-Source: ADFU+vvq3Mn/UD2TKx9aTpeVf4l/BqUeXD0u/9e6D89fXHsd+F0Es5aMNULarLNIPEobzu+nIHI7aA==
X-Received: by 2002:a17:902:740b:: with SMTP id g11mr2364168pll.166.1584148067728;
        Fri, 13 Mar 2020 18:07:47 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id 127sm40494300pfb.130.2020.03.13.18.07.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 18:07:46 -0700 (PDT)
Date:   Sat, 14 Mar 2020 06:37:44 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200314010744.GA5494@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200313164751.GA30134@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313164751.GA30134@roeck-us.net>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[ + Nathan ]

Hi Guenter, 

On Fri, Mar 13, 2020 at 09:47:51AM -0700, Guenter Roeck wrote:

> This patch causes all my mips qemu emulations to hang during boot. This affects
> all mips, mips64, mipsel, and mipsel64 emulations.

Can you please apply,

https://lkml.kernel.org/r/20200311152751.GA5044@afzalpc,

on top of this patch & see if it fixes the issue. Else please let me
know the qemu command line you are using.

Nathan reported a similar issue, above fix fixes that issue.

Regards
afzal
