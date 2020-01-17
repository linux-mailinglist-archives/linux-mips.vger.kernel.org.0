Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59F9141260
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 21:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgAQUle (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jan 2020 15:41:34 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39852 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbgAQUle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jan 2020 15:41:34 -0500
Received: by mail-il1-f195.google.com with SMTP id x5so22346681ila.6
        for <linux-mips@vger.kernel.org>; Fri, 17 Jan 2020 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=l67Q2JaZUuxYTTc14dadVG8CPVycSfA7W0h/5578mZM=;
        b=nn60vdPY5om2CTLHZCbVBXuD2dZtq3zIDLFjv2f6o6pOmcpQs/R92aqkvIGklG1VpR
         XpNW7h8CCl1ZSya8QZWLffcfrqvDWXl5mpvfQHLU6HDBeUc1PDAD56OIt0QJlcN/XWZ+
         2sTUPoSecKfaTR2L4Ci21mLETPNqvNgPUoYE0OSz2plDFr+UCSZjkOPhI+GiEOQaaJ8H
         oP6PnPn12MdknimQ5M8Fe85zN/+BQVIoG07WB//UeFh1qz+ilqI3tk07zQRi2qS27RNW
         YwaR7d0Hzjdm+XiTGhn0sXAazXuwx8zTapGag25WVCVYr78/TJf9U8BhImtBvcbES8t6
         qk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=l67Q2JaZUuxYTTc14dadVG8CPVycSfA7W0h/5578mZM=;
        b=lKtmWtAHHUZuNzBZv3SeC9GIqmj6HpBL9KMBZkhNEj0YYMKB2raT4vkARkvAs6nqez
         RwRxH94uk2VN2phaWmH8ftHuqJGL47Hqwm9FjxENHCdGHNVeOtx8nPDzlhYB05Gu4t+u
         /quSMb5vniUkkCBfsqMBjVcm13thsbC8QL0Tgx6eODM3bYAtOje/yYlaNotg8nXbm+xA
         UCdcZO68Uevn18R0rLbeKN1R6eoKHo+xgGpqi+nrnBRioXzmpO+L2m96F3T/5iyhlDwP
         kJZQXLAd7M+KMfIoEsZVQjHBFxVezdpxNAecp3o6xzN/uOvnxZHFdUEqWgOz2TGCcNwe
         fMJw==
X-Gm-Message-State: APjAAAV/cNIIGGKg0RzczGa6HJBZAHglxqOjzw+pjyKGZM+sZsi8duV2
        OSiQFyAk+acD4fvlJXmVpisODw==
X-Google-Smtp-Source: APXvYqyhD/DuCNRVkINRezmPM4CoIncLA7Blgo9UbiMKgcAlY+o2QZJtykuXI74GzHHVKdxUjToU5w==
X-Received: by 2002:a92:ba93:: with SMTP id t19mr369490ill.0.1579293694120;
        Fri, 17 Jan 2020 12:41:34 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id x77sm8237951ilk.34.2020.01.17.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 12:41:33 -0800 (PST)
Date:   Fri, 17 Jan 2020 12:41:31 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Michal Simek <michal.simek@xilinx.com>
cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Christoph Hellwig <hch@lst.de>,
        Christoph Hellwig <hch@infradead.org>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-s390@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Wesley Terpstra <wesley@sifive.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Chris Zankel <chris@zankel.net>,
        Ingo Molnar <mingo@redhat.com>,
        Waiman Long <longman@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        James Hogan <jhogan@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Make dma-contiguous.h a mandatory
 include/asm header
In-Reply-To: <0274919c5e3b134df19d943f99cb7e84e5135ccd.1579248206.git.michal.simek@xilinx.com>
Message-ID: <alpine.DEB.2.21.9999.2001171241070.98477@viisi.sifive.com>
References: <cover.1579248206.git.michal.simek@xilinx.com> <0274919c5e3b134df19d943f99cb7e84e5135ccd.1579248206.git.michal.simek@xilinx.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 17 Jan 2020, Michal Simek wrote:

> dma-continuguous.h is generic for all architectures except arm32 which has
> its own version.
> 
> Similar change was done for msi.h by commit a1b39bae16a6
> ("asm-generic: Make msi.h a mandatory include/asm header")
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # for arch/riscv


- Paul
