Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF92D75984C
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 16:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjGSO0d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jul 2023 10:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjGSO0W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Jul 2023 10:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3425DE53
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689776716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
        b=UK723g9Xbr6CfQVpAoY61fE/wD+k+i5j9vQtue0SzSARbIRQAQ33QEVLRYyqRcs7RTlA7q
        nUqwUBGs4TJO9TdvHOAxNxVd4U6SP8JLrC31ghJL+tYEixl/O1FhT8rSexw9fBL02Y7Byf
        RaGw01FqRx4PXkb6Xu5hqvD4enQnpW8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-DblpK3CDP4uv-2efM47u4Q-1; Wed, 19 Jul 2023 10:25:11 -0400
X-MC-Unique: DblpK3CDP4uv-2efM47u4Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31429e93f26so4199975f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 07:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776710; x=1690381510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
        b=RsR5wg+9EcHwd+ZkhiZZBr/ONq1R9j14Nga0bWcbxY3FojpRT+H/1glwXaOGD/yLvp
         PR4ZlA1MCzcifeB5/mZ+xdXSuQKKLGY/VnQV8sIwtd5PKn+Sj5ijiEvJwO/1pyteUfnO
         SyZEITRNoyGjhTtkkBUtnz1HUBJ2xn0IVyx0NQiL+qNHaNM8EGOFaoMD/HcvHmgUuW2k
         b6qTSw5Lwaq46EwgSr5NbVteKZNYmk4A0phRb/WdKg8C6iHSN4LWw+s91dmFDr74Acvr
         PoiHL+rTEtT4eJ+ut8K1dYdIDZR8wb079k9eiGh4NOeTgIZsPD+Nw5AfQCunjYozfreD
         OZYQ==
X-Gm-Message-State: ABy/qLY/J6t4j2ViAMA4lpEXhMALTgC3CFdBgnj8xD5Dd7pFxqhZb+Sy
        QpRNAzZdfVZFFXFIv3y+9YmkW1zY7CVAySLyUhHaVaTOdlFmKkIARcGlotTwgidjZlkymrU1PLe
        /ioc80SWwuaDJILB/4x94hw==
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15856wrp.50.1689776710228;
        Wed, 19 Jul 2023 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdsBbmhlUZVwgJXnbSuIEfuMAzDx5IOvgnijOdvMDteAVkW8k0bDz3T8ek9eZvK84UcEFXkg==
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15829wrp.50.1689776709888;
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t13-20020a7bc3cd000000b003fc05b89e5bsm1805793wmj.34.2023.07.19.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
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
Subject: Re: [PATCH v2 8/9] hyperv: avoid dependency on screen_info
In-Reply-To: <20230719123944.3438363-9-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-9-arnd@kernel.org>
Date:   Wed, 19 Jul 2023 16:25:08 +0200
Message-ID: <877cqwhtbv.fsf@minerva.mail-host-address-is-not-set>
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
> The two hyperv framebuffer drivers (hyperv_fb or hyperv_drm_drv) access the
> global screen_info in order to take over from the sysfb framebuffer, which
> in turn could be handled by simplefb, simpledrm or efifb. Similarly, the
> vmbus_drv code marks the original EFI framebuffer as reserved, but this
> is not required if there is no sysfb.
>
> As a preparation for making screen_info itself more local to the sysfb
> helper code, add a compile-time conditional in all three files that relate
> to hyperv fb and just skip this code if there is no sysfb that needs to
> be unregistered.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

