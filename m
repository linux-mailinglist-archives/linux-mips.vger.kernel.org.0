Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0288677118
	for <lists+linux-mips@lfdr.de>; Sun, 22 Jan 2023 18:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjAVR3M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Jan 2023 12:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjAVR3L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Jan 2023 12:29:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862EA1DB82;
        Sun, 22 Jan 2023 09:29:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FA6C60B39;
        Sun, 22 Jan 2023 17:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76580C433AE;
        Sun, 22 Jan 2023 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674408549;
        bh=I5pV/HoNpTTtkCpHa3T7LwdnAQwwVwXQ/luDQGSOteE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L3R3VeuI8b7SphmS83VI3MhZIjgDm6ANfUG/6GLDdAssBf8R7BhAf78erSlDbdCOA
         SHR+IgQ6/XkSHZgpJfPyQerUVWvlHhmeN4a9pX9i1iiMGQR1NCtYmJ1cXwTwfhZX7o
         nSUmSWPnPqViFik1ksvVU9V1IDz/9d4RBT2fojd5aUL4rHTIN4194hnchaX8aC+BTF
         BVqo/UYoMw7a7dCGuw7CuV/Pc986UJI4q+9eT9V3NhMq3b5TVJgU4xKxtdcd/uUXK3
         PYu79weFDNfEExeZDTIf8YARqxjWnMGBiR5AM+Sg0Tc3PNXSMv1Gk/Hn9eD63agM4/
         o6TOm8IVHvoHg==
Received: by mail-oi1-f179.google.com with SMTP id r9so8523019oig.12;
        Sun, 22 Jan 2023 09:29:09 -0800 (PST)
X-Gm-Message-State: AFqh2kpwFP9zBxu/eOTY+pL7eQyFODBDtZw4arSHn9F0wTdEOGfjy/HN
        9AT5UHFhWtH+h52GBVpRD9p9Y9oD+ItKrAwb7MA=
X-Google-Smtp-Source: AMrXdXv8T6XTJrOgPfMqPTdeIlKFiVnKdMrLMQCnsb/JOpLPDdW3j/ypXqu3QgM9nVl1xzM73W2o7XvcmK9sHyhknFM=
X-Received: by 2002:a05:6808:1786:b0:35e:7c55:b015 with SMTP id
 bg6-20020a056808178600b0035e7c55b015mr1279449oib.287.1674408548537; Sun, 22
 Jan 2023 09:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Jan 2023 02:28:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-HmyKYAWbF2MHEU1FzBzKOvE2DU7Js6tntszLrtUkDg@mail.gmail.com>
Message-ID: <CAK7LNAQ-HmyKYAWbF2MHEU1FzBzKOvE2DU7Js6tntszLrtUkDg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        linux-mips@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 12, 2023 at 12:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> Clang can emit a few different warnings when it encounters a flag that it
> recognizes but does not support internally. These warnings are elevated to
> errors within {as,cc}-option via -Werror to catch unsupported flags that should
> not be added to KBUILD_{A,C}FLAGS; see commit c3f0d0bc5b01 ("kbuild, LLVMLinux:
> Add -Werror to cc-option to support clang").
>
> If an unsupported flag is unconditionally to KBUILD_{A,C}FLAGS, all subsequent
> {as,cc}-option will always fail, preventing supported and even potentially
> necessary flags from getting adding to the tool flags.
>
> One would expect these warnings to be visible in the kernel build logs since
> they are added to KBUILD_{A,C}FLAGS but unfortunately, these warnings are
> hidden with clang's -Qunused-arguments flag, which is added to KBUILD_CPPFLAGS
> and used for both compiling and assembling files.
>
> Patches 1-4 address the internal inconsistencies of invoking the assembler
> within kbuild by using KBUILD_AFLAGS consistently and using '-x
> assembler-with-cpp' over '-x assembler'. This matches how assembly files are
> built across the kernel and helps avoid problems in situations where macro
> definitions or warning flags are present in KBUILD_AFLAGS, which cause
> instances of -Wunused-command-line-argument when the preprocessor is not called
> to consume them. There were a couple of places in architecture code where this
> change would break things so those are fixed first.
>
> Patches 5-12 clean up warnings that will show up when -Qunused-argument is
> dropped. I hope none of these are controversial.
>
> Patch 13 turns two warnings into errors so that the presence of unused flags
> cannot be easily ignored.
>
> Patch 14 drops -Qunused-argument. This is done last so that it can be easily
> reverted if need be.
>
> This series has seen my personal test framework, which tests several different
> configurations and architectures, with LLVM tip of tree (16.0.0). I have done
> defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mips,
> powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping the
> rest of the test infrastructure will catch any lurking problems.
>
> I would like this series to stay together so that there is no opportunity for
> breakage so please consider giving acks so that this can be carried via the
> kbuild tree (and many thanks to the people who have already provided such
> tags).


All applied to linux-kbuild. Thanks.

I left small comments in 07/14.








> ---
> Changes in v2:
> - Pick up tags where provided (thank you everyone!)
> - Patch 6 and 9: Clarify that '-s' is a compiler flag that is only relevant to
>   the linking phase and remove all mention of the assembler's '-s' flag, as the
>   assembler is never directly invoked (Nick, Segher)
> - Patch 7: Move '-z noexecstack' into new ldflags-y variable (Nick)
> - Patch 8: Reword commit message to explain the problem in a clearer manner
>   (Nick)
> - Link to v1: https://lore.kernel.org/r/20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org
>
> ---
> Nathan Chancellor (12):
>       MIPS: Always use -Wa,-msoft-float and eliminate GAS_HAS_SET_HARDFLOAT
>       MIPS: Prefer cc-option for additions to cflags
>       powerpc: Remove linker flag from KBUILD_AFLAGS
>       powerpc/vdso: Remove unused '-s' flag from ASFLAGS
>       powerpc/vdso: Improve linker flags
>       powerpc/vdso: Remove an unsupported flag from vgettimeofday-32.o with clang
>       s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
>       s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
>       s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
>       drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
>       kbuild: Turn a couple more of clang's unused option warnings into errors
>       kbuild: Stop using '-Qunused-arguments' with clang
>
> Nick Desaulniers (2):
>       x86/boot/compressed: prefer cc-option for CFLAGS additions
>       kbuild: Update assembler calls to use proper flags and language target
>
>  Makefile                                    |  1 -
>  arch/mips/Makefile                          | 13 ++-------
>  arch/mips/include/asm/asmmacro-32.h         |  4 +--
>  arch/mips/include/asm/asmmacro.h            | 42 ++++++++++++++---------------
>  arch/mips/include/asm/fpregdef.h            | 14 ----------
>  arch/mips/include/asm/mipsregs.h            | 20 +++-----------
>  arch/mips/kernel/genex.S                    |  2 +-
>  arch/mips/kernel/r2300_fpu.S                |  4 +--
>  arch/mips/kernel/r4k_fpu.S                  | 12 ++++-----
>  arch/mips/kvm/fpu.S                         |  6 ++---
>  arch/mips/loongson2ef/Platform              |  2 +-
>  arch/powerpc/Makefile                       |  2 +-
>  arch/powerpc/kernel/vdso/Makefile           | 25 +++++++++++------
>  arch/s390/kernel/vdso64/Makefile            |  4 +--
>  arch/s390/purgatory/Makefile                |  2 +-
>  arch/x86/boot/compressed/Makefile           |  2 +-
>  drivers/gpu/drm/amd/display/dc/dml/Makefile |  3 ++-
>  scripts/Kconfig.include                     |  2 +-
>  scripts/Makefile.clang                      |  2 ++
>  scripts/Makefile.compiler                   |  8 +++---
>  scripts/as-version.sh                       |  2 +-
>  21 files changed, 74 insertions(+), 98 deletions(-)
> ---
> base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
> change-id: 20221228-drop-qunused-arguments-0c5c7dae54fb
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--
Best Regards
Masahiro Yamada
