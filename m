Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EAC759833
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 16:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjGSOZS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jul 2023 10:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjGSOZH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Jul 2023 10:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064992137
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689776638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AYL0WxfELPHjwx6ZiDqavEiQQIijrcopNRfhrvLV03A=;
        b=Fy8i5nOuJc9vT64qGI1h402ACgpl6AB64fP+pSezsKXU7oX0ASaTIrY6cxryrL9cV8OvNU
        v0sIZeURGjZ3itQ6NPF0MFxRumgHZwjZfMTfec/c/ZD6nxw8e6l3CXc8VJBtqU8rK9ljTf
        QgQvU5p0Ucau8pjJq5qE+94Kp1SQ6E8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-BtV7FFFbN8yOBPKRUrh6wA-1; Wed, 19 Jul 2023 10:23:56 -0400
X-MC-Unique: BtV7FFFbN8yOBPKRUrh6wA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31701b27d19so394987f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 07:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776635; x=1690381435;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYL0WxfELPHjwx6ZiDqavEiQQIijrcopNRfhrvLV03A=;
        b=PH1nRBhDeXKta5CG062MNK9hXnq4ZlIaV35Z9ZPvbn6dQkb6aBDNMK8ZV7mZyUQfEN
         FANmxWSA9n+LcssXpcqtEK2ytAsDGCs6M1FBUV0YJkcpBzNUU8R1xcTIojYV3o72/WlF
         aXG4x1cYzzJMLAZ/tQHHpsllVeV8SApHWMMnrvF08pr8L3md8tBWrnKpyDnIwuezixb7
         DezFvmKttlyzQaYY9Axg/HKASrb4gyELDqNg7isrXj4VUF3UP20A3QD+gBTA3ESAki71
         M2ZEZHa1uZvd9cUbfvdyx+icbps6XjhzEQf3nWp+sJpSvrRDxFloS3i/moBthcknHSAZ
         gSWQ==
X-Gm-Message-State: ABy/qLbm10t005jlSUEotqcQJsZVApbuDsMjnFRl1/ddnMAhXGXdJ3v7
        14Cc3n82l7hKABSNTCWoAm8gilTyKxbO2iYZmJjH13K0/To/JUf9XE64uW6Sg3+6sUK69UCYmRh
        Kcpoe/JjryWjVZpXXTaU6pw==
X-Received: by 2002:adf:f406:0:b0:317:15f5:a1cc with SMTP id g6-20020adff406000000b0031715f5a1ccmr41821wro.22.1689776635706;
        Wed, 19 Jul 2023 07:23:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHAuWaDn4wkaE25f0gFYugdobiggD0h46Z8p4U2s3LOHj24u3Bx+1zUs1XU1djJ3aSjiu0SQg==
X-Received: by 2002:adf:f406:0:b0:317:15f5:a1cc with SMTP id g6-20020adff406000000b0031715f5a1ccmr41757wro.22.1689776635405;
        Wed, 19 Jul 2023 07:23:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q19-20020a056000137300b003143d80d11dsm5429196wrz.112.2023.07.19.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:23:54 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Dexuan Cui <decui@microsoft.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Khalid Aziz <khalid@gonehiking.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 7/9] vga16fb: drop powerpc support
In-Reply-To: <20230719123944.3438363-8-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-8-arnd@kernel.org>
Date:   Wed, 19 Jul 2023 16:23:53 +0200
Message-ID: <87a5vshtdy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> I noticed that commit 0db5b61e0dc07 ("fbdev/vga16fb: Create
> EGA/VGA devices in sysfb code") broke vga16fb on non-x86 platforms,
> because the sysfb code never creates a vga-framebuffer device when
> screen_info.orig_video_isVGA is set to '1' instead of VIDEO_TYPE_VGAC.
>
> However, it turns out that the only architecture that has allowed
> building vga16fb in the past 20 years is powerpc, and this only worked
> on two 32-bit platforms and never on 64-bit powerpc. The last machine
> that actually used this was removed in linux-3.10, so this is all dead
> code and can be removed.
>
> The big-endian support in vga16fb.c could also be removed, but I'd just
> leave this in place.
>
> Fixes: 933ee7119fb14 ("powerpc: remove PReP platform")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

