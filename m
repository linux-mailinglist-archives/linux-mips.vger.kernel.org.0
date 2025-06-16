Return-Path: <linux-mips+bounces-9314-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B45ADA574
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 03:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B467A51D6
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 01:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695F9481B6;
	Mon, 16 Jun 2025 01:15:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75241547C9;
	Mon, 16 Jun 2025 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036515; cv=none; b=nudtRxQPO9MJuyDOCr23AGFFXFCR1mc0VjRRRhBVaGLLmYohGDxXau9kBW/dDd0dT+Bkrwz/qIws+Ewgot3IfMVKXV+9OT2k6kH5ACXXM7xSq7/7u7bEM1ph4OFfWSLMu8KFjiunub+dxPUbHas8XMukxjY1Q5HJaslPVr/ukTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036515; c=relaxed/simple;
	bh=dvTGtxAknQfEoc4zbDY1V7wwkCrQM97z3Atd+/H9l4g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=faKtu9yOH/piR8rpkUAK7rD1cbUaFvRm+BxRUsk6cNwLwe4uF8rGPhpU6pTaROLqEadmGvAL9GE+OL0sdeeTorfHi29iqQYD0OS4oZkG13QmReKISXXPtSjO98wdje38fjOifOCHKWWl5cp+UJ7tr7olpOI9uSurw5wYpd0A6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxnOIVcE9owWYXAQ--.19204S3;
	Mon, 16 Jun 2025 09:15:01 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxH+UGcE9oJlYcAQ--.19628S3;
	Mon, 16 Jun 2025 09:14:49 +0800 (CST)
Subject: Re: [PATCH 4/8] KVM: Move include/kvm/iodev.h to include/linux as
 kvm_iodev.h
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250611001042.170501-1-seanjc@google.com>
 <20250611001042.170501-5-seanjc@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <50a32984-f2ed-249a-c055-81ad35e1fa51@loongson.cn>
Date: Mon, 16 Jun 2025 09:13:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250611001042.170501-5-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+UGcE9oJlYcAQ--.19628S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWfGr4rtr1fJrW8Cr1ktFW3XFc_yoWDAFWxpF
	4DCF4kAr43Cr18JF9Fy3ZIvFyUXws5Kr1UKa4UuFWUAw1aqr1kXw4vkrn8tFn5Aayvqa10
	gFWagF15Zw4UX3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUJ529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDU
	UUU



On 2025/6/11 上午8:10, Sean Christopherson wrote:
> Move iodev.h, the last remaining holdout in include/kvm, to the standard
> include/linux directory as kvm_iodev.h and delete include/kvm.
> 
> Acked-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   MAINTAINERS                                | 1 -
>   arch/arm64/include/asm/kvm_vgic.h          | 2 +-
>   arch/arm64/kvm/vgic/vgic-mmio-v2.c         | 2 +-
>   arch/arm64/kvm/vgic/vgic-mmio-v3.c         | 2 +-
>   arch/arm64/kvm/vgic/vgic-mmio.c            | 2 +-
>   arch/loongarch/include/asm/kvm_eiointc.h   | 2 +-
>   arch/loongarch/include/asm/kvm_ipi.h       | 2 +-
>   arch/loongarch/include/asm/kvm_pch_pic.h   | 2 +-
>   arch/mips/include/asm/kvm_host.h           | 3 +--
>   arch/powerpc/kvm/mpic.c                    | 2 +-
>   arch/riscv/kvm/aia_aplic.c                 | 2 +-
>   arch/riscv/kvm/aia_imsic.c                 | 2 +-
>   arch/x86/kvm/i8254.h                       | 2 +-
>   arch/x86/kvm/ioapic.h                      | 2 +-
>   arch/x86/kvm/irq.h                         | 2 +-
>   arch/x86/kvm/lapic.h                       | 2 +-
>   include/{kvm/iodev.h => linux/kvm_iodev.h} | 0
>   virt/kvm/coalesced_mmio.c                  | 3 +--
>   virt/kvm/eventfd.c                         | 2 +-
>   virt/kvm/kvm_main.c                        | 3 +--
>   20 files changed, 18 insertions(+), 22 deletions(-)
>   rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10cf54c8f727..a2cd432273e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13011,7 +13011,6 @@ W:	http://www.linux-kvm.org
>   T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
>   F:	Documentation/virt/kvm/
>   F:	include/asm-generic/kvm*
> -F:	include/kvm/iodev.h
>   F:	include/linux/kvm*
>   F:	include/trace/events/kvm.h
>   F:	include/uapi/asm-generic/kvm*
> diff --git a/arch/arm64/include/asm/kvm_vgic.h b/arch/arm64/include/asm/kvm_vgic.h
> index 4a34f7f0a864..09d7f628fa3b 100644
> --- a/arch/arm64/include/asm/kvm_vgic.h
> +++ b/arch/arm64/include/asm/kvm_vgic.h
> @@ -14,7 +14,7 @@
>   #include <linux/static_key.h>
>   #include <linux/types.h>
>   #include <linux/xarray.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/list.h>
>   #include <linux/jump_label.h>
>   
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
> index d00c8a74fad6..889440a8b129 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
> @@ -6,9 +6,9 @@
>   #include <linux/irqchip/arm-gic.h>
>   #include <linux/kvm.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/nospec.h>
>   
> -#include <kvm/iodev.h>
>   #include <asm/kvm_vgic.h>
>   
>   #include "vgic.h"
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> index 505d4e389885..db95d3ccbd14 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> @@ -7,8 +7,8 @@
>   #include <linux/irqchip/arm-gic-v3.h>
>   #include <linux/kvm.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/interrupt.h>
> -#include <kvm/iodev.h>
>   
>   #include <asm/kvm_emulate.h>
>   #include <asm/kvm_arm.h>
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
> index ec1b13abc728..de689e0e881f 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio.c
> @@ -9,7 +9,7 @@
>   #include <linux/irq.h>
>   #include <linux/kvm.h>
>   #include <linux/kvm_host.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   #include <asm/kvm_arch_timer.h>
>   #include <asm/kvm_vgic.h>
>   
> diff --git a/arch/loongarch/include/asm/kvm_eiointc.h b/arch/loongarch/include/asm/kvm_eiointc.h
> index a3a40aba8acf..0049b0b79477 100644
> --- a/arch/loongarch/include/asm/kvm_eiointc.h
> +++ b/arch/loongarch/include/asm/kvm_eiointc.h
> @@ -6,7 +6,7 @@
>   #ifndef __ASM_KVM_EIOINTC_H
>   #define __ASM_KVM_EIOINTC_H
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   #define EIOINTC_IRQS			256
>   #define EIOINTC_ROUTE_MAX_VCPUS		256
> diff --git a/arch/loongarch/include/asm/kvm_ipi.h b/arch/loongarch/include/asm/kvm_ipi.h
> index 060163dfb4a3..3956b230f087 100644
> --- a/arch/loongarch/include/asm/kvm_ipi.h
> +++ b/arch/loongarch/include/asm/kvm_ipi.h
> @@ -6,7 +6,7 @@
>   #ifndef __ASM_KVM_IPI_H
>   #define __ASM_KVM_IPI_H
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   #define LARCH_INT_IPI			12
>   
> diff --git a/arch/loongarch/include/asm/kvm_pch_pic.h b/arch/loongarch/include/asm/kvm_pch_pic.h
> index e6df6a4c1c70..4b37e3134e52 100644
> --- a/arch/loongarch/include/asm/kvm_pch_pic.h
> +++ b/arch/loongarch/include/asm/kvm_pch_pic.h
> @@ -6,7 +6,7 @@
>   #ifndef __ASM_KVM_PCH_PIC_H
>   #define __ASM_KVM_PCH_PIC_H
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   #define PCH_PIC_SIZE			0x3e8
>   
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index c14b10821817..0d7dd89ca5bf 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -16,6 +16,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/types.h>
>   #include <linux/kvm.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/kvm_types.h>
>   #include <linux/threads.h>
>   #include <linux/spinlock.h>
> @@ -24,8 +25,6 @@
>   #include <asm/inst.h>
>   #include <asm/mipsregs.h>
>   
> -#include <kvm/iodev.h>
> -
>   /* MIPS KVM register ids */
>   #define MIPS_CP0_32(_R, _S)					\
>   	(KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U32 | (8 * (_R) + (_S)))
> diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
> index 23e9c2bd9f27..b25a03251544 100644
> --- a/arch/powerpc/kvm/mpic.c
> +++ b/arch/powerpc/kvm/mpic.c
> @@ -26,6 +26,7 @@
>   #include <linux/slab.h>
>   #include <linux/mutex.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/errno.h>
>   #include <linux/fs.h>
>   #include <linux/anon_inodes.h>
> @@ -33,7 +34,6 @@
>   #include <asm/mpic.h>
>   #include <asm/kvm_para.h>
>   #include <asm/kvm_ppc.h>
> -#include <kvm/iodev.h>
>   
>   #define MAX_CPU     32
>   #define MAX_SRC     256
> diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
> index f59d1c0c8c43..bf163724aec5 100644
> --- a/arch/riscv/kvm/aia_aplic.c
> +++ b/arch/riscv/kvm/aia_aplic.c
> @@ -9,10 +9,10 @@
>   
>   #include <linux/irqchip/riscv-aplic.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/math.h>
>   #include <linux/spinlock.h>
>   #include <linux/swab.h>
> -#include <kvm/iodev.h>
>   
>   struct aplic_irq {
>   	raw_spinlock_t lock;
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index 29ef9c2133a9..ae3c0807baa9 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -11,10 +11,10 @@
>   #include <linux/bitmap.h>
>   #include <linux/irqchip/riscv-imsic.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/math.h>
>   #include <linux/spinlock.h>
>   #include <linux/swab.h>
> -#include <kvm/iodev.h>
>   #include <asm/csr.h>
>   
>   #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
> diff --git a/arch/x86/kvm/i8254.h b/arch/x86/kvm/i8254.h
> index a768212ba821..4de7a0b88e4f 100644
> --- a/arch/x86/kvm/i8254.h
> +++ b/arch/x86/kvm/i8254.h
> @@ -4,7 +4,7 @@
>   
>   #include <linux/kthread.h>
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   struct kvm_kpit_channel_state {
>   	u32 count; /* can be 65536 */
> diff --git a/arch/x86/kvm/ioapic.h b/arch/x86/kvm/ioapic.h
> index aa8cb4ac0479..cb36c36affd3 100644
> --- a/arch/x86/kvm/ioapic.h
> +++ b/arch/x86/kvm/ioapic.h
> @@ -3,7 +3,7 @@
>   #define __KVM_IO_APIC_H
>   
>   #include <linux/kvm_host.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   #include "irq.h"
>   
>   struct kvm;
> diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
> index 76d46b2f41dd..b21b03aa2ee7 100644
> --- a/arch/x86/kvm/irq.h
> +++ b/arch/x86/kvm/irq.h
> @@ -13,9 +13,9 @@
>   #include <linux/mm_types.h>
>   #include <linux/hrtimer.h>
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/spinlock.h>
>   
> -#include <kvm/iodev.h>
>   #include "lapic.h"
>   
>   #define PIC_NUM_PINS 16
> diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
> index 4ce30db65828..43ffbded5f72 100644
> --- a/arch/x86/kvm/lapic.h
> +++ b/arch/x86/kvm/lapic.h
> @@ -2,7 +2,7 @@
>   #ifndef __KVM_X86_LAPIC_H
>   #define __KVM_X86_LAPIC_H
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   #include <linux/kvm_host.h>
>   
> diff --git a/include/kvm/iodev.h b/include/linux/kvm_iodev.h
> similarity index 100%
> rename from include/kvm/iodev.h
> rename to include/linux/kvm_iodev.h
> diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
> index 375d6285475e..d0f84e3611da 100644
> --- a/virt/kvm/coalesced_mmio.c
> +++ b/virt/kvm/coalesced_mmio.c
> @@ -9,8 +9,7 @@
>    *
>    */
>   
> -#include <kvm/iodev.h>
> -
> +#include <linux/kvm_iodev.h>
>   #include <linux/kvm_host.h>
>   #include <linux/slab.h>
>   #include <linux/kvm.h>
> diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
> index 11e5d1e3f12e..35786d59b233 100644
> --- a/virt/kvm/eventfd.c
> +++ b/virt/kvm/eventfd.c
> @@ -26,7 +26,7 @@
>   #include <linux/irqbypass.h>
>   #include <trace/events/kvm.h>
>   
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>   
>   #ifdef CONFIG_HAVE_KVM_IRQCHIP
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index eec82775c5bf..a401ba32ecaa 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -10,9 +10,8 @@
>    *   Yaniv Kamay  <yaniv@qumranet.com>
>    */
>   
> -#include <kvm/iodev.h>
> -
>   #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>   #include <linux/kvm.h>
>   #include <linux/module.h>
>   #include <linux/errno.h>
> 
About modification with LoongArch specific.
Reviewed-by: Bibo Mao <maobibo@loongson.cn>


