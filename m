Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711511CF406
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 14:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELMIQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 08:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELMIP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 08:08:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8D8C061A0C;
        Tue, 12 May 2020 05:08:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so22964392wmc.5;
        Tue, 12 May 2020 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/FLRjf9hr9Wue54+WNr0zXbnZF+iSV3GXYeiU8HlKUs=;
        b=C94Vym6xI00UYRDN+NIS+DD284S7lEcD0wcN4UD/HtU+GgugMHw6ygRqnbKg6zHY88
         v55FSE4AG+wzgDuy6twoRfcp0GkoEcR449s5wg7PFw2e61VGaNrsWA3VmZEgNnXDMdnN
         uA9X3saQU5KMM/RuMqgfDqBoUeKZ5P8OB4EEjhLLAQTOGmn/wOlhpqdKXCcL/tlNI+iS
         yw0F0aVdDwFZvZFt5C8SSlnb2/c/8mzYZWfcNlB4/O6oG9lskUXa6RMgncYcTzRY9zzw
         RUSFrX39HhvA63N2MqKXb2doZ+bl/CJKtmysLZKNmDu3JT4XQ3qwS5/ilx9Wb3ko2unA
         wtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/FLRjf9hr9Wue54+WNr0zXbnZF+iSV3GXYeiU8HlKUs=;
        b=POnDdUJP6zEzUsXVwRPsmPRa5vYpwpFzglD7uOmtI9ZXwBrZWtkmIRU++26xOrhWc5
         xZjn7wwWNadiK8YEjRrWKapIMrzjriuJ3qorgQy1HCZZo5g0ohCpYhj/gOTYyRaul5kX
         l2t2CwzkXbcTUhPJVpHp1/HLQPaCm94A/8FFxRy99wOxHCI9uk8YoawhCc2Oq/Vo/eno
         z2BVcns2y9W+m4pM+1xVIgQtcaZNCvPxd2hCd0f8Ngu2j+QLuEaYtYX7LSeZiFiTxVZv
         t8JRqVXMNWPjrYnIb4fWjnjlkqXDcKAMolsKZF1yg+UGBK4LkeXw3v+P6+hz0J5lJUpA
         25/g==
X-Gm-Message-State: AGi0PubE7a5QbQZTePGn71Zbqs2OO9ddofELAFG9EYcNsotMKclkghDg
        99jaFjn/N7w/eoK4TA1oDfs8Tafiq95b6oRnJug=
X-Google-Smtp-Source: APiQypKqmXF/rvTUzE3o/NvmCvYOj1UNV+wh4lDOhNOqGmhqDt2FSIDuUA94YOTV7bbNXRgP6e4067TCSfA/9SDhurI=
X-Received: by 2002:a1c:5685:: with SMTP id k127mr7113034wmb.50.1589285293809;
 Tue, 12 May 2020 05:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1589279480-27722-1-git-send-email-chenhc@lemote.com> <1589279480-27722-13-git-send-email-chenhc@lemote.com>
In-Reply-To: <1589279480-27722-13-git-send-email-chenhc@lemote.com>
From:   Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Tue, 12 May 2020 14:08:00 +0200
Message-ID: <CAHiYmc6yi8Db6QYwNzHzo4rOuuDdt1FRKX+2kowBTfen7Ksadw@mail.gmail.com>
Subject: Re: [PATCH V4 12/14] KVM: MIPS: Add CONFIG6 and DIAG registers emulation
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D1=83=D1=82=D0=BE, 12. =D0=BC=D0=B0=D1=98 2020. =D1=83 12:35 Huacai Chen <=
chenhc@lemote.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>
> Loongson-3 has CONFIG6 and DIAG registers which need to be emulate.

Please just correct the typo: emulate -> emulated.
> CONFIG6 is mostly used to enable/disable FTLB and SFB, while DIAG is
> mostly used to flush BTB, ITLB, DTLB, VTLB and FTLB.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/kvm_host.h |  7 +++++
>  arch/mips/include/asm/mipsregs.h |  7 +++++
>  arch/mips/kvm/tlb.c              | 41 ++++++++++++++++++++++++++
>  arch/mips/kvm/vz.c               | 62 ++++++++++++++++++++++++++++++++++=
+++++-
>  4 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm=
_host.h
> index 3fd2f1c..30b5e33 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -68,9 +68,11 @@
>  #define KVM_REG_MIPS_CP0_CONFIG3       MIPS_CP0_32(16, 3)
>  #define KVM_REG_MIPS_CP0_CONFIG4       MIPS_CP0_32(16, 4)
>  #define KVM_REG_MIPS_CP0_CONFIG5       MIPS_CP0_32(16, 5)
> +#define KVM_REG_MIPS_CP0_CONFIG6       MIPS_CP0_32(16, 6)
>  #define KVM_REG_MIPS_CP0_CONFIG7       MIPS_CP0_32(16, 7)
>  #define KVM_REG_MIPS_CP0_MAARI         MIPS_CP0_64(17, 2)
>  #define KVM_REG_MIPS_CP0_XCONTEXT      MIPS_CP0_64(20, 0)
> +#define KVM_REG_MIPS_CP0_DIAG          MIPS_CP0_32(22, 0)
>  #define KVM_REG_MIPS_CP0_ERROREPC      MIPS_CP0_64(30, 0)
>  #define KVM_REG_MIPS_CP0_KSCRATCH1     MIPS_CP0_64(31, 2)
>  #define KVM_REG_MIPS_CP0_KSCRATCH2     MIPS_CP0_64(31, 3)
> @@ -256,6 +258,7 @@ struct mips_coproc {
>  #define MIPS_CP0_WATCH_LO      18
>  #define MIPS_CP0_WATCH_HI      19
>  #define MIPS_CP0_TLB_XCONTEXT  20
> +#define MIPS_CP0_DIAG          22
>  #define MIPS_CP0_ECC           26
>  #define MIPS_CP0_CACHE_ERR     27
>  #define MIPS_CP0_TAG_LO                28
> @@ -927,6 +930,10 @@ void kvm_vz_save_guesttlb(struct kvm_mips_tlb *buf, =
unsigned int index,
>                           unsigned int count);
>  void kvm_vz_load_guesttlb(const struct kvm_mips_tlb *buf, unsigned int i=
ndex,
>                           unsigned int count);
> +#ifdef CONFIG_CPU_LOONGSON64
> +void kvm_loongson_clear_guest_vtlb(void);
> +void kvm_loongson_clear_guest_ftlb(void);
> +#endif
>  #endif
>
>  void kvm_mips_suspend_mm(int cpu);
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mip=
sregs.h
> index 796fe47..ce40fbf 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -674,6 +674,9 @@
>  #define MIPS_CONF5_CV          (_ULCAST_(1) << 29)
>  #define MIPS_CONF5_K           (_ULCAST_(1) << 30)
>
> +#define MIPS_CONF6_INTIMER     (_ULCAST_(1) << 6)
> +#define MIPS_CONF6_EXTIMER     (_ULCAST_(1) << 7)
> +#define MIPS_CONF6_SFBEN       (_ULCAST_(1) << 8)
>  #define MIPS_CONF6_SYND                (_ULCAST_(1) << 13)
>  /* proAptiv FTLB on/off bit */
>  #define MIPS_CONF6_FTLBEN      (_ULCAST_(1) << 15)
> @@ -993,6 +996,8 @@
>  /* Disable Branch Return Cache */
>  #define R10K_DIAG_D_BRC                (_ULCAST_(1) << 22)
>
> +/* Flush BTB */
> +#define LOONGSON_DIAG_BTB      (_ULCAST_(1) << 1)
>  /* Flush ITLB */
>  #define LOONGSON_DIAG_ITLB     (_ULCAST_(1) << 2)
>  /* Flush DTLB */
> @@ -2825,7 +2830,9 @@ __BUILD_SET_C0(status)
>  __BUILD_SET_C0(cause)
>  __BUILD_SET_C0(config)
>  __BUILD_SET_C0(config5)
> +__BUILD_SET_C0(config6)
>  __BUILD_SET_C0(config7)
> +__BUILD_SET_C0(diag)
>  __BUILD_SET_C0(intcontrol)
>  __BUILD_SET_C0(intctl)
>  __BUILD_SET_C0(srsmap)
> diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
> index 7cd9216..1418715 100644
> --- a/arch/mips/kvm/tlb.c
> +++ b/arch/mips/kvm/tlb.c
> @@ -20,6 +20,7 @@
>
>  #include <asm/cpu.h>
>  #include <asm/bootinfo.h>
> +#include <asm/mipsregs.h>
>  #include <asm/mmu_context.h>
>  #include <asm/pgtable.h>
>  #include <asm/cacheflush.h>
> @@ -622,6 +623,46 @@ void kvm_vz_load_guesttlb(const struct kvm_mips_tlb =
*buf, unsigned int index,
>  }
>  EXPORT_SYMBOL_GPL(kvm_vz_load_guesttlb);
>
> +#ifdef CONFIG_CPU_LOONGSON64
> +void kvm_loongson_clear_guest_vtlb(void)
> +{
> +       int idx =3D read_gc0_index();
> +
> +       /* Set root GuestID for root probe and write of guest TLB entry *=
/
> +       set_root_gid_to_guest_gid();
> +
> +       write_gc0_index(0);
> +       guest_tlbinvf();
> +       write_gc0_index(idx);
> +
> +       clear_root_gid();
> +       set_c0_diag(LOONGSON_DIAG_ITLB | LOONGSON_DIAG_DTLB);
> +}
> +EXPORT_SYMBOL_GPL(kvm_loongson_clear_guest_vtlb);
> +
> +void kvm_loongson_clear_guest_ftlb(void)
> +{
> +       int i;
> +       int idx =3D read_gc0_index();
> +
> +       /* Set root GuestID for root probe and write of guest TLB entry *=
/
> +       set_root_gid_to_guest_gid();
> +
> +       for (i =3D current_cpu_data.tlbsizevtlb;
> +            i < (current_cpu_data.tlbsizevtlb +
> +                    current_cpu_data.tlbsizeftlbsets);
> +            i++) {
> +               write_gc0_index(i);
> +               guest_tlbinvf();
> +       }
> +       write_gc0_index(idx);
> +
> +       clear_root_gid();
> +       set_c0_diag(LOONGSON_DIAG_ITLB | LOONGSON_DIAG_DTLB);
> +}
> +EXPORT_SYMBOL_GPL(kvm_loongson_clear_guest_ftlb);
> +#endif
> +
>  #endif
>
>  /**
> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
> index e5c751b..fc0f8d5 100644
> --- a/arch/mips/kvm/vz.c
> +++ b/arch/mips/kvm/vz.c
> @@ -127,6 +127,11 @@ static inline unsigned int kvm_vz_config5_guest_wrma=
sk(struct kvm_vcpu *vcpu)
>         return mask;
>  }
>
> +static inline unsigned int kvm_vz_config6_guest_wrmask(struct kvm_vcpu *=
vcpu)
> +{
> +       return MIPS_CONF6_INTIMER | MIPS_CONF6_EXTIMER | MIPS_CONF6_SYND;
> +}
> +
>  /*
>   * VZ optionally allows these additional Config bits to be written by ro=
ot:
>   * Config:     M, [MT]
> @@ -181,6 +186,12 @@ static inline unsigned int kvm_vz_config5_user_wrmas=
k(struct kvm_vcpu *vcpu)
>         return kvm_vz_config5_guest_wrmask(vcpu) | MIPS_CONF5_MRP;
>  }
>
> +static inline unsigned int kvm_vz_config6_user_wrmask(struct kvm_vcpu *v=
cpu)
> +{
> +       return kvm_vz_config6_guest_wrmask(vcpu) |
> +               MIPS_CONF6_SFBEN | MIPS_CONF6_FTLBEN | MIPS_CONF6_FTLBDIS=
;
> +}
> +
>  static gpa_t kvm_vz_gva_to_gpa_cb(gva_t gva)
>  {
>         /* VZ guest has already converted gva to gpa */
> @@ -930,7 +941,8 @@ static enum emulation_result kvm_vz_gpsi_cop0(union m=
ips_instruction inst,
>                                     (sel =3D=3D 2 ||        /* SRSCtl */
>                                      sel =3D=3D 3)) ||      /* SRSMap */
>                                    (rd =3D=3D MIPS_CP0_CONFIG &&
> -                                   (sel =3D=3D 7)) ||      /* Config7 */
> +                                   (sel =3D=3D 6 ||        /* Config6 */
> +                                    sel =3D=3D 7)) ||      /* Config7 */
>                                    (rd =3D=3D MIPS_CP0_LLADDR &&
>                                     (sel =3D=3D 2) &&       /* MAARI */
>                                     cpu_guest_has_maar &&
> @@ -938,6 +950,11 @@ static enum emulation_result kvm_vz_gpsi_cop0(union =
mips_instruction inst,
>                                    (rd =3D=3D MIPS_CP0_ERRCTL &&
>                                     (sel =3D=3D 0))) {      /* ErrCtl */
>                                 val =3D cop0->reg[rd][sel];
> +#ifdef CONFIG_CPU_LOONGSON64
> +                       } else if (rd =3D=3D MIPS_CP0_DIAG &&
> +                                  (sel =3D=3D 0)) {        /* Diag */
> +                               val =3D cop0->reg[rd][sel];
> +#endif
>                         } else {
>                                 val =3D 0;
>                                 er =3D EMULATE_FAIL;
> @@ -1000,9 +1017,40 @@ static enum emulation_result kvm_vz_gpsi_cop0(unio=
n mips_instruction inst,
>                                    cpu_guest_has_maar &&
>                                    !cpu_guest_has_dyn_maar) {
>                                 kvm_write_maari(vcpu, val);
> +                       } else if (rd =3D=3D MIPS_CP0_CONFIG &&
> +                                  (sel =3D=3D 6)) {
> +                               cop0->reg[rd][sel] =3D (int)val;
>                         } else if (rd =3D=3D MIPS_CP0_ERRCTL &&
>                                    (sel =3D=3D 0)) {        /* ErrCtl */
>                                 /* ignore the written value */
> +#ifdef CONFIG_CPU_LOONGSON64
> +                       } else if (rd =3D=3D MIPS_CP0_DIAG &&
> +                                  (sel =3D=3D 0)) {        /* Diag */
> +                               unsigned long flags;
> +
> +                               local_irq_save(flags);
> +                               if (val & LOONGSON_DIAG_BTB) {
> +                                       /* Flush BTB */
> +                                       set_c0_diag(LOONGSON_DIAG_BTB);
> +                               }
> +                               if (val & LOONGSON_DIAG_ITLB) {
> +                                       /* Flush ITLB */
> +                                       set_c0_diag(LOONGSON_DIAG_ITLB);
> +                               }
> +                               if (val & LOONGSON_DIAG_DTLB) {
> +                                       /* Flush DTLB */
> +                                       set_c0_diag(LOONGSON_DIAG_DTLB);
> +                               }
> +                               if (val & LOONGSON_DIAG_VTLB) {
> +                                       /* Flush VTLB */
> +                                       kvm_loongson_clear_guest_vtlb();
> +                               }
> +                               if (val & LOONGSON_DIAG_FTLB) {
> +                                       /* Flush FTLB */
> +                                       kvm_loongson_clear_guest_ftlb();
> +                               }
> +                               local_irq_restore(flags);
> +#endif
>                         } else {
>                                 er =3D EMULATE_FAIL;
>                         }
> @@ -1690,6 +1738,7 @@ static u64 kvm_vz_get_one_regs[] =3D {
>         KVM_REG_MIPS_CP0_CONFIG3,
>         KVM_REG_MIPS_CP0_CONFIG4,
>         KVM_REG_MIPS_CP0_CONFIG5,
> +       KVM_REG_MIPS_CP0_CONFIG6,
>  #ifdef CONFIG_64BIT
>         KVM_REG_MIPS_CP0_XCONTEXT,
>  #endif
> @@ -2017,6 +2066,9 @@ static int kvm_vz_get_one_reg(struct kvm_vcpu *vcpu=
,
>                         return -EINVAL;
>                 *v =3D read_gc0_config5();
>                 break;
> +       case KVM_REG_MIPS_CP0_CONFIG6:
> +               *v =3D kvm_read_sw_gc0_config6(cop0);
> +               break;
>         case KVM_REG_MIPS_CP0_MAAR(0) ... KVM_REG_MIPS_CP0_MAAR(0x3f):
>                 if (!cpu_guest_has_maar || cpu_guest_has_dyn_maar)
>                         return -EINVAL;
> @@ -2286,6 +2338,14 @@ static int kvm_vz_set_one_reg(struct kvm_vcpu *vcp=
u,
>                         write_gc0_config5(v);
>                 }
>                 break;
> +       case KVM_REG_MIPS_CP0_CONFIG6:
> +               cur =3D kvm_read_sw_gc0_config6(cop0);
> +               change =3D (cur ^ v) & kvm_vz_config6_user_wrmask(vcpu);
> +               if (change) {
> +                       v =3D cur ^ change;
> +                       kvm_write_sw_gc0_config6(cop0, (int)v);
> +               }
> +               break;
>         case KVM_REG_MIPS_CP0_MAAR(0) ... KVM_REG_MIPS_CP0_MAAR(0x3f):
>                 if (!cpu_guest_has_maar || cpu_guest_has_dyn_maar)
>                         return -EINVAL;
> --
> 2.7.0
>
