Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9522E21AFE9
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 09:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgGJHPh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 03:15:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41058 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725943AbgGJHPg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Jul 2020 03:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594365333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JBLK5CBk2nZNnzlnXGDcyKLYPLiIIdnLjccWhrFJFtQ=;
        b=dF3AbrPJCs+eAxYnsNg4mYA56rUTiQWWiF1M7/5Q24PEvueBejr1mp7jASoGoZNOuhma+r
        Hd6f9QVU/u56iwONR2HPdiWYqGoal2nh70Zn2R6K+sCSb/484a6QRav1V+FgaDEF503doE
        jKsY2VSYrWMTKmxQ0WK3sCI06Fphzpg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-qN1KLwUjNtSGIrSWgIgfIQ-1; Fri, 10 Jul 2020 03:15:32 -0400
X-MC-Unique: qN1KLwUjNtSGIrSWgIgfIQ-1
Received: by mail-wr1-f69.google.com with SMTP id v3so4944003wrq.10
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2020 00:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JBLK5CBk2nZNnzlnXGDcyKLYPLiIIdnLjccWhrFJFtQ=;
        b=WJTz7wRZVoxH8M3IyvKB9TccT7ZW+BNWILVfqNku5l9QJRlyGVvErfMT+8RRJPmEgA
         hWdTBxH/lRWiDHyM0exHo+cDMNIvcc8tOz1ykLi260AXbpOreBwRjm9JYqF+ZuopNokR
         vFzuugs+7uzsJebviGOlpKfxn4UgyMbN/IZn47yyytKeUgWCOpzuNEZOUklee02JzeiX
         RbVqHvFgqohgVziuwE917MYqpZzZL9yoeONqOIVjA0WRsQFpO3i5Hg1uxzrebTjSJ6lY
         SDlFoAOIQPYFftTb8OoFF0ltsP9H830aYOQHH35Tio5OY0DX2d469ofehOOLTBIY789E
         JN8g==
X-Gm-Message-State: AOAM530UGeQI6osejqTYgwRuWD+9uZ+QGKztB93ogd8RaGyvIDy4S8J2
        k+2lR46dKgyYmkXa8JHwVkS1a5jLeN2kOZKGJD8v4XpoPoj+9KuunZ5vyWn88JPm4ARubSqPozo
        n6j4b7cqC9BMlmJnmmDNlQQ==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr3688207wmd.101.1594365330842;
        Fri, 10 Jul 2020 00:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLkZi5TShL/4z4VHn340jG1ycyGRH/hNP2ypKvwJnucrUd9Azxl5ktb84UOxWF5Uhkivwtrg==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr3688190wmd.101.1594365330615;
        Fri, 10 Jul 2020 00:15:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id v18sm9533001wrv.49.2020.07.10.00.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:15:30 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] MIPS KVM related clean-ups
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@pm.me>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jason Wang <jasowang@redhat.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20200710063047.154611-1-jiaxun.yang@flygoat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b43cbc19-79d2-756e-b5eb-0a7e16d92e84@redhat.com>
Date:   Fri, 10 Jul 2020 09:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710063047.154611-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/07/20 08:30, Jiaxun Yang wrote:
> Retire some features that never worked in the real world.
> 
> Also I wonder if there are any actual user of TE KVM.
> Will Huacai or Alexsander take care relevant code?

Queued patches 2 and 3, thanks.  One is outside my maintenance area.

Paolo

> Thanks.
> 
> Jiaxun Yang (3):
>   MIPS: Retire kvm paravirt
>   MIPS: KVM: Limit Trap-and-Emulate to MIPS32R2 only
>   MIPS: KVM: Remove outdated README
> 
>  arch/mips/Kbuild.platforms                |   1 -
>  arch/mips/Kconfig                         |  20 +-
>  arch/mips/configs/mips_paravirt_defconfig |  98 ------
>  arch/mips/include/asm/Kbuild              |   1 +
>  arch/mips/include/asm/kvm_para.h          | 115 -------
>  arch/mips/include/uapi/asm/Kbuild         |   2 +
>  arch/mips/include/uapi/asm/kvm_para.h     |   5 -
>  arch/mips/kvm/00README.txt                |  31 --
>  arch/mips/kvm/Kconfig                     |   3 +-
>  arch/mips/paravirt/Kconfig                |   7 -
>  arch/mips/paravirt/Makefile               |  14 -
>  arch/mips/paravirt/Platform               |   7 -
>  arch/mips/paravirt/paravirt-irq.c         | 368 ----------------------
>  arch/mips/paravirt/paravirt-smp.c         | 145 ---------
>  arch/mips/paravirt/serial.c               |  39 ---
>  arch/mips/paravirt/setup.c                |  67 ----
>  arch/mips/pci/Makefile                    |   1 -
>  arch/mips/pci/pci-virtio-guest.c          | 131 --------
>  18 files changed, 6 insertions(+), 1049 deletions(-)
>  delete mode 100644 arch/mips/configs/mips_paravirt_defconfig
>  delete mode 100644 arch/mips/include/asm/kvm_para.h
>  delete mode 100644 arch/mips/include/uapi/asm/kvm_para.h
>  delete mode 100644 arch/mips/kvm/00README.txt
>  delete mode 100644 arch/mips/paravirt/Kconfig
>  delete mode 100644 arch/mips/paravirt/Makefile
>  delete mode 100644 arch/mips/paravirt/Platform
>  delete mode 100644 arch/mips/paravirt/paravirt-irq.c
>  delete mode 100644 arch/mips/paravirt/paravirt-smp.c
>  delete mode 100644 arch/mips/paravirt/serial.c
>  delete mode 100644 arch/mips/paravirt/setup.c
>  delete mode 100644 arch/mips/pci/pci-virtio-guest.c
> 

