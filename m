Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C257A419E
	for <lists+linux-mips@lfdr.de>; Mon, 18 Sep 2023 08:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239315AbjIRG5N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Sep 2023 02:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240048AbjIRG5K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Sep 2023 02:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3A5E6
        for <linux-mips@vger.kernel.org>; Sun, 17 Sep 2023 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695020176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
        b=N2SHxQheYCAyYoDTubgHuQAo6cWzg53c12ssjO+5szHBD7K65iNY4El/SeaUBS9lWqrv0k
        PTjCdpFshiIVvQUAHQc/LP+cam10FGYSdKG+CZ9I51T3Hmh0ip/Q/ZkfXCXDvLpMsPxfHr
        XFokbYp5RNv8w2vFVSTM/Snl6bYnY0E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-V68NoDMHPzGYVBrTcRiceA-1; Mon, 18 Sep 2023 02:56:13 -0400
X-MC-Unique: V68NoDMHPzGYVBrTcRiceA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3172a94b274so2811235f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 17 Sep 2023 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695020172; x=1695624972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
        b=ITajvp09SdPtfC/CEEc2FN8eiN0cPXS9eaIO4evXQXdHpVOqSF6W4FHJxpb4S/gVhv
         yWxs3Ov5xpch4gPCxdCqIzCdtlJHvvhGVgps5PYKqJqrAFxWETO199L449/AfWsTN/Li
         tA4a3/Zp/JKyRI3RFBVeJtha+R3MnDeWNFLSqLr3jW9HtIERI/cYCoRccnB5C3ZLvtfl
         GZS2u88UmWn1MIOC0C76Ia2T/I3k0OgMSrc8XPWC7LfRel8jkYxVmS6VvTffdjfddmmK
         jMGuSUzsqbkeTDjpn8Li8IrfYzxHhAxrXF+smKrLW7NEdKN3pN90/Ewge+op6bNx2DnW
         cYzw==
X-Gm-Message-State: AOJu0YxDewKiI3uCa7rE1K6pHXPzxjwOmk+Zx+FKPd2uVeLhKlsqpb2f
        YXNrqDB6Ee/s0uSFFnWWRfe/HzmdYgQzC+7KzrdYkLBh9RJfEaxI4lqCF/Kc56QH5junZBf7uG0
        LEr8EHwn5u9kgyWH3OZfT1A==
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947593wrt.66.1695020172210;
        Sun, 17 Sep 2023 23:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6F/Z9q4tB58E26+mCTcb2TpjD2EEslfwOYb0HqPPBuG0zLaR6K3OsqOUHedxMDM3AqkpDEA==
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947581wrt.66.1695020171900;
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b003143b14848dsm11523936wrx.102.2023.09.17.23.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Message-ID: <a6a77718-219f-30f6-b8de-acd7aadf3b0c@redhat.com>
Date:   Mon, 18 Sep 2023 08:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/26] KVM: s390: Stop adding virt/kvm to the arch include
 path
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-19-seanjc@google.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230916003118.2540661-19-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/09/2023 02.31, Sean Christopherson wrote:
> Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
> intended to be used only by other code in virt/kvm, i.e. are "private" to
> the core KVM code.  It's not clear that s390 *ever* included a header from
> virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
> Makefile when s390 support was first added.
> 
> The only headers in virt/kvm at the time were the x86 specific ioapic.h,
> and iodev.h, neither of which shows up as an #include in the diff for the
> commit range 37817f2982d0f..e976a2b997fc4.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/s390/kvm/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index 02217fb4ae10..f17249ab2a72 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -5,7 +5,7 @@
>   
>   include $(srctree)/virt/kvm/Makefile.kvm
>   
> -ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
> +ccflags-y := -Iarch/s390/kvm
>   
>   kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o

Reviewed-by: Thomas Huth <thuth@redhat.com>

