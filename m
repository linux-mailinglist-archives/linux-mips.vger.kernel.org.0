Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF147B2867
	for <lists+linux-mips@lfdr.de>; Fri, 29 Sep 2023 00:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbjI1WX6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Sep 2023 18:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbjI1WXw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Sep 2023 18:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37672CCA
        for <linux-mips@vger.kernel.org>; Thu, 28 Sep 2023 15:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695939706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yJlZv5KfytnzZmRqZMI7mLTWvvegYQeNtr0CrdJHxrc=;
        b=Ez/Uh1kmKg7MrjRNPCLulA36pOVjQ5gy+yOz1Jj2F1p7YDVNjgYUbnohzK5m8M6UMihyZI
        5Nir5HLf1gp7t9/HQZBBB6HClzl4nxU3aSfeXGRqbjnDrAU/ebPMJyYLmqfB83zPhdfkUg
        YN8894ftLye1JsVY6MxPTN61qhGbvyI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-3Sr1PEIlNMuhtPG6cpKsfA-1; Thu, 28 Sep 2023 18:21:45 -0400
X-MC-Unique: 3Sr1PEIlNMuhtPG6cpKsfA-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-79fc8c8b1dbso1190255739f.2
        for <linux-mips@vger.kernel.org>; Thu, 28 Sep 2023 15:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939704; x=1696544504;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJlZv5KfytnzZmRqZMI7mLTWvvegYQeNtr0CrdJHxrc=;
        b=XHUtLkSdutwdK6mQxHyT/J58GHtVsfZjDAaoqjADeGdE1yBs+MTqUAsElhY5X6LOcl
         9n3wz3leBcv9AoKRJbQ4sSZ2m6dBBAczex+xQAPQV2itE6WQs6rC0RU/ypPKtlkygX/X
         5BK3/XwELKF0ke1CdUVep1OPphxKb96Ii+9slFdj3q6oDhTQDaaQhvynWtc1UlGIhZTi
         arlNGTDwbYlXsmCsQvDr2GFmgEysNTOWMyo/Z1sRizSxebdPxjws/WErHB9XOtZQ8G7a
         Zp3QdpCVzZijLlsQo7JID49LyvZ9Jik88xhe6F2BaOAPNE9SbTYJHd8yCuxjPZFAbIt4
         /PWQ==
X-Gm-Message-State: AOJu0YzKU2TXb8eHckANwPWI3ClBHLzYa2agguXxRO+iuTyvHDFv3A0W
        bPyl3pomO1i25G/AZTN8zEnqYJ9cfSwhWcShO2uFfhRH361BGrn+9MebP9GAkDGHqT0xbOadRdY
        j93QfEL0m17BGuDBatQwlwg==
X-Received: by 2002:a5e:9e09:0:b0:795:8805:1378 with SMTP id i9-20020a5e9e09000000b0079588051378mr2451922ioq.9.1695939704270;
        Thu, 28 Sep 2023 15:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAEb9IDAtgYjj6uLy0BK3ZEot+uDPg45XlWdcKZXMCg89/F3JSTuwB2CMQYAcH0oVDsnNUFw==
X-Received: by 2002:a5e:9e09:0:b0:795:8805:1378 with SMTP id i9-20020a5e9e09000000b0079588051378mr2451906ioq.9.1695939703976;
        Thu, 28 Sep 2023 15:21:43 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:42 -0700 (PDT)
Date:   Thu, 28 Sep 2023 16:21:05 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
        Andy Lutomirski <luto@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it
 with other KVM related code
Message-ID: <20230928162105.2e347cd5.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-3-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
        <20230916003118.2540661-3-seanjc@google.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Sep 2023 17:30:54 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
> down in vfio_main.c to colocate them with other KVM-specific functions,
> e.g. to allow wrapping them all with a single CONFIG_KVM check.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
>  1 file changed, 52 insertions(+), 52 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 80e39f7a6d8f..6368eed7b7b2 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -381,58 +381,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
>  
> -#if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> -{
> -	void (*pfn)(struct kvm *kvm);
> -	bool (*fn)(struct kvm *kvm);
> -	bool ret;
> -
> -	lockdep_assert_held(&device->dev_set->lock);
> -
> -	if (!kvm)
> -		return;
> -
> -	pfn = symbol_get(kvm_put_kvm);
> -	if (WARN_ON(!pfn))
> -		return;
> -
> -	fn = symbol_get(kvm_get_kvm_safe);
> -	if (WARN_ON(!fn)) {
> -		symbol_put(kvm_put_kvm);
> -		return;
> -	}
> -
> -	ret = fn(kvm);
> -	symbol_put(kvm_get_kvm_safe);
> -	if (!ret) {
> -		symbol_put(kvm_put_kvm);
> -		return;
> -	}
> -
> -	device->put_kvm = pfn;
> -	device->kvm = kvm;
> -}
> -
> -void vfio_device_put_kvm(struct vfio_device *device)
> -{
> -	lockdep_assert_held(&device->dev_set->lock);
> -
> -	if (!device->kvm)
> -		return;
> -
> -	if (WARN_ON(!device->put_kvm))
> -		goto clear;
> -
> -	device->put_kvm(device->kvm);
> -	device->put_kvm = NULL;
> -	symbol_put(kvm_put_kvm);
> -
> -clear:
> -	device->kvm = NULL;
> -}
> -#endif
> -
>  /* true if the vfio_device has open_device() called but not close_device() */
>  static bool vfio_assert_device_open(struct vfio_device *device)
>  {
> @@ -1354,6 +1302,58 @@ bool vfio_file_enforced_coherent(struct file *file)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>  
> +#if IS_ENABLED(CONFIG_KVM)
> +void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> +{
> +	void (*pfn)(struct kvm *kvm);
> +	bool (*fn)(struct kvm *kvm);
> +	bool ret;
> +
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	if (!kvm)
> +		return;
> +
> +	pfn = symbol_get(kvm_put_kvm);
> +	if (WARN_ON(!pfn))
> +		return;
> +
> +	fn = symbol_get(kvm_get_kvm_safe);
> +	if (WARN_ON(!fn)) {
> +		symbol_put(kvm_put_kvm);
> +		return;
> +	}
> +
> +	ret = fn(kvm);
> +	symbol_put(kvm_get_kvm_safe);
> +	if (!ret) {
> +		symbol_put(kvm_put_kvm);
> +		return;
> +	}
> +
> +	device->put_kvm = pfn;
> +	device->kvm = kvm;
> +}
> +
> +void vfio_device_put_kvm(struct vfio_device *device)
> +{
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	if (!device->kvm)
> +		return;
> +
> +	if (WARN_ON(!device->put_kvm))
> +		goto clear;
> +
> +	device->put_kvm(device->kvm);
> +	device->put_kvm = NULL;
> +	symbol_put(kvm_put_kvm);
> +
> +clear:
> +	device->kvm = NULL;
> +}
> +#endif
> +
>  static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
>  	struct vfio_device_file *df = file->private_data;

