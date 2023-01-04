Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04E065DD33
	for <lists+linux-mips@lfdr.de>; Wed,  4 Jan 2023 20:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240057AbjADTzG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Jan 2023 14:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbjADTy5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Jan 2023 14:54:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BFD1AD9D;
        Wed,  4 Jan 2023 11:54:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 267CFB81714;
        Wed,  4 Jan 2023 19:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310B3C433D2;
        Wed,  4 Jan 2023 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862093;
        bh=L+MNyD4+J2gyZIniEp1jnrEedIiPMHOYlb+OJsuTqoA=;
        h=From:Subject:Date:To:Cc:From;
        b=Bltnvl8eBa4iWRprtH8bhHBNd74MinRaprS5FPLE+O5X6NBm8prVFG4+kC5eqetEg
         VNS7V9184Yyke96GgYZlNYf3pkuCgFEGExspz1qbRiA33+TFMSTZ9OIcrUBDYP/RJU
         lCJ08b+WRoNrRYMGRmzI76Xv4lbPY+TMDAvIns8E7OiO2gppVFzRlnJ2i/6B/VZ0lc
         JeVhbZwEdi7VcDsLeeyfvwITTem2fW09O5wf3FU+jPNQmhV+adDUqnYxZ8HuEf5Onv
         zScIVPQjZpVQ+X7an9Vh4Pd6wqSAbA08PJOq8xe5gaCZaU8j8GfaTM1rwJHCovACyQ
         EIyet6WRohvsg==
From:   Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
Date:   Wed, 04 Jan 2023 12:54:18 -0700
Message-Id: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvZtWMC/x2NQQqDQAwAvyI5N6BLpaVfKT1kd6PmYLSJWwri3
 7v2OAzD7OBswg6PZgfjj7gsWqG7NJAm0pFRcmUIbQhdCHfMtqz4LlqcM5KNZWbdHNvUp1sm7q9D
 hBpHcsZopGk685l8YzvFajzI9398vo7jB9ivTEOBAAAA
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        linux-s390@vger.kernel.org, harry.wentland@amd.com,
        sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4767; i=nathan@kernel.org;
 h=from:subject:message-id; bh=L+MNyD4+J2gyZIniEp1jnrEedIiPMHOYlb+OJsuTqoA=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3ZW1WS5GXp9rDnt/6hu/3G7mYecz4f8sPovxa91XotL
 2e5CRykLgxgHg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhI9wdGhsttn4qEr1577ln566Myr/
 BNt4db9/dNrVRYwLP66qbc7LkM/z28WKNDG/Vum/jOz8p4fvzjYZvp+1xdA27LmtopzX7qzwgA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

Clang can emit a few different warnings when it encounters a flag that it
recognizes but does not support internally. These warnings are elevated to
errors within {as,cc}-option via -Werror to catch unsupported flags that should
not be added to KBUILD_{A,C}FLAGS; see commit c3f0d0bc5b01 ("kbuild, LLVMLinux:
Add -Werror to cc-option to support clang").

If an unsupported flag is unconditionally to KBUILD_{A,C}FLAGS, all subsequent
{as,cc}-option will always fail, preventing supported and even potentially
necessary flags from getting adding to the tool flags.

One would expect these warnings to be visible in the kernel build logs since
they are added to KBUILD_{A,C}FLAGS but unfortunately, these warnings are
hidden with clang's -Qunused-arguments flag, which is added to KBUILD_CPPFLAGS
and used for both compiling and assembling files.

Patches 1-4 address the internal inconsistencies of invoking the assembler
within kbuild by using KBUILD_AFLAGS consistently and using '-x
assembler-with-cpp' over '-x assembler'. This matches how assembly files are
built across the kernel and helps avoid problems in situations where macro
definitions or warning flags are present in KBUILD_AFLAGS, which cause
instances of -Wunused-command-line-argument when the preprocessor is not called
to consume them. There were a couple of places in architecture code where this
change would break things so those are fixed first.

Patches 5-12 clean up warnings that will show up when -Qunused-argument is
dropped. I hope none of these are controversial.

Patch 13 turns two warnings into errors so that the presence of unused flags
cannot be easily ignored.

Patch 14 drops -Qunused-argument. This is done last so that it can be easily
reverted if need be.

This series has seen my personal test framework, which tests several different
configurations and architectures, with LLVM tip of tree (16.0.0). I have done
defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mips,
powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping the
rest of the test infrastructure will catch any lurking problems.

I would like this series to stay together so that there is no opportunity for
breakage so please consider giving acks so that this can be carried via the
kbuild tree.

---
Nathan Chancellor (12):
      MIPS: Always use -Wa,-msoft-float and eliminate GAS_HAS_SET_HARDFLOAT
      MIPS: Prefer cc-option for additions to cflags
      powerpc: Remove linker flag from KBUILD_AFLAGS
      powerpc/vdso: Remove unused '-s' flag from ASFLAGS
      powerpc/vdso: Improve linker flags
      powerpc/vdso: Remove an unsupported flag from vgettimeofday-32.o with clang
      s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
      s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
      s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
      drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
      kbuild: Turn a couple more of clang's unused option warnings into errors
      kbuild: Stop using '-Qunused-arguments' with clang

Nick Desaulniers (2):
      x86/boot/compressed: prefer cc-option for CFLAGS additions
      kbuild: Update assembler calls to use proper flags and language target

 Makefile                                    |  1 -
 arch/mips/Makefile                          | 13 ++-------
 arch/mips/include/asm/asmmacro-32.h         |  4 +--
 arch/mips/include/asm/asmmacro.h            | 42 ++++++++++++++---------------
 arch/mips/include/asm/fpregdef.h            | 14 ----------
 arch/mips/include/asm/mipsregs.h            | 20 +++-----------
 arch/mips/kernel/genex.S                    |  2 +-
 arch/mips/kernel/r2300_fpu.S                |  4 +--
 arch/mips/kernel/r4k_fpu.S                  | 12 ++++-----
 arch/mips/kvm/fpu.S                         |  6 ++---
 arch/mips/loongson2ef/Platform              |  2 +-
 arch/powerpc/Makefile                       |  2 +-
 arch/powerpc/kernel/vdso/Makefile           | 25 +++++++++++------
 arch/s390/kernel/vdso64/Makefile            |  4 +--
 arch/s390/purgatory/Makefile                |  2 +-
 arch/x86/boot/compressed/Makefile           |  2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile |  3 ++-
 scripts/Kconfig.include                     |  2 +-
 scripts/Makefile.clang                      |  2 ++
 scripts/Makefile.compiler                   |  8 +++---
 scripts/as-version.sh                       |  2 +-
 21 files changed, 74 insertions(+), 98 deletions(-)
---
base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
change-id: 20221228-drop-qunused-arguments-0c5c7dae54fb

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>
