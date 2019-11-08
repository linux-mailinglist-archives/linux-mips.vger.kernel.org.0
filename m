Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D77BF5959
	for <lists+linux-mips@lfdr.de>; Fri,  8 Nov 2019 22:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbfKHVM2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Nov 2019 16:12:28 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38659 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731181AbfKHVM1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Nov 2019 16:12:27 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MuUrM-1hcjO90hCk-00rZpx; Fri, 08 Nov 2019 22:12:15 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     y2038@lists.linaro.org, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Subject: [PATCH 09/23] y2038: stat: avoid 'time_t' in 'struct stat'
Date:   Fri,  8 Nov 2019 22:07:29 +0100
Message-Id: <20191108210824.1534248-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108210236.1296047-1-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hQI2PKcMsbaE8ATmNf2BhWXqyHFlTZauM/SrY3t0jiAIGW3xOTB
 hBBN0IXOSct8hlnQ6w0xvFFKPx4AzXlvbQt+HI21ZvqdieWlTPMP53mXMixyGqPmqpLX2DY
 18kt9E8OgSmLQXE29GwEdOk7+TRAL6MlF7MNEprN+IqVwZmx25e2l/aFzmEtBVdILamjFUy
 Huk0oJvJ7dYi4x9qJROYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K2C61v4B7ck=:smMLVvXqVSSEvnAoP3AxsT
 OuKZb07AaMqYhICWFPMqlbsAapbNDFK4bOzD/3oRJwzr7UJm1i6wF9XvZSkcRdmlPv/KX0Jgu
 yUvg6oGveX/ZLlgNXufjr35smf+6i4THT3VNVU7PWkK5mBgzxteOrbgzGYGMXVk14gqD9wjVY
 Jxa+QtngWpzu6yKHFZp10FgRvCqS0sF1gopRhTHA3/Ulu/bHkRjS40+U/BRGvBZcKFODyqNIu
 +RF9Fjpc+bY7sIqlKpYISoze8N+wEdBNI6GKALttvycVWdXZaqqsrFvBPRn4chaAmh3Cin9DD
 RFAW16O6wAMluc5+dvvPJ8clH/mYnZkfmffzCO+BITb8sEwxe5fvEfH2qPJV80Ll6NyK97F07
 ksemAwS1FEtmrqxA0DOgJGdF1soJ7/tnMHTLt2BIgmZNbRGlRWxu12h+D9EOUrkqD/BSBSkFW
 OBUi6Kz/2kMsLiEVTskzYiBN5n3mtyWwQobf00gKtMITgu03G8SbcXsr0Y86FRRgFr+H5mSRd
 CjaBhfs876ftE8uUYNwvI+7tUgfoK+FjGAJZKOCARN79dIE6wSLV55b/hJ6/Eas64A/v56kHS
 TbCz731akDnJRGLqLGCgD/XHfaDrA7u2NpAnbPrddHwjpY99pomh/6+wUNKnUMZ+OnnFQJ+B5
 E8VJWnuQ3b+TDEJBGDDCKm4LANvO+4Tw8XAxKyWBfnQtDSs/FNGqLlL63ZlfEdlrYetPrrjTW
 onYjBFAoYV7bHtvkZLX8eanC/RADpovly16lRZpwutbetKA6NqvtFbseTgxWEAbmLyWB5q/ap
 1VlEUAyc/EQF/xFTgy6ejeKrMwbFlvGg2j/NlimY8/yEUyY0xA+cgukXFuQ47MtjhJg/ufCdt
 /STLYGmt0wiwvRWxE7ZQ==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The time_t definition may differ between user space and kernel space,
so replace time_t with an unambiguous 'long' for the mips and sparc.

The same structures also contain 'off_t', which has the same problem,
so replace that as well on those two architectures and powerpc.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/uapi/asm/stat.h    | 16 ++++++++--------
 arch/powerpc/include/uapi/asm/stat.h |  2 +-
 arch/sparc/include/uapi/asm/stat.h   | 24 ++++++++++++------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/mips/include/uapi/asm/stat.h b/arch/mips/include/uapi/asm/stat.h
index 95416f366d7f..3d2a3b71845c 100644
--- a/arch/mips/include/uapi/asm/stat.h
+++ b/arch/mips/include/uapi/asm/stat.h
@@ -26,17 +26,17 @@ struct stat {
 	gid_t		st_gid;
 	unsigned	st_rdev;
 	long		st_pad2[2];
-	off_t		st_size;
+	long		st_size;
 	long		st_pad3;
 	/*
 	 * Actually this should be timestruc_t st_atime, st_mtime and st_ctime
 	 * but we don't have it under Linux.
 	 */
-	time_t		st_atime;
+	long		st_atime;
 	long		st_atime_nsec;
-	time_t		st_mtime;
+	long		st_mtime;
 	long		st_mtime_nsec;
-	time_t		st_ctime;
+	long		st_ctime;
 	long		st_ctime_nsec;
 	long		st_blksize;
 	long		st_blocks;
@@ -70,13 +70,13 @@ struct stat64 {
 	 * Actually this should be timestruc_t st_atime, st_mtime and st_ctime
 	 * but we don't have it under Linux.
 	 */
-	time_t		st_atime;
+	long		st_atime;
 	unsigned long	st_atime_nsec;	/* Reserved for st_atime expansion  */
 
-	time_t		st_mtime;
+	long		st_mtime;
 	unsigned long	st_mtime_nsec;	/* Reserved for st_mtime expansion  */
 
-	time_t		st_ctime;
+	long		st_ctime;
 	unsigned long	st_ctime_nsec;	/* Reserved for st_ctime expansion  */
 
 	unsigned long	st_blksize;
@@ -105,7 +105,7 @@ struct stat {
 	unsigned int		st_rdev;
 	unsigned int		st_pad1[3]; /* Reserved for st_rdev expansion */
 
-	off_t			st_size;
+	long			st_size;
 
 	/*
 	 * Actually this should be timestruc_t st_atime, st_mtime and st_ctime
diff --git a/arch/powerpc/include/uapi/asm/stat.h b/arch/powerpc/include/uapi/asm/stat.h
index afd25f2ff4e8..7871055e5e32 100644
--- a/arch/powerpc/include/uapi/asm/stat.h
+++ b/arch/powerpc/include/uapi/asm/stat.h
@@ -40,7 +40,7 @@ struct stat {
 	uid_t		st_uid;
 	gid_t		st_gid;
 	unsigned long	st_rdev;
-	off_t		st_size;
+	long		st_size;
 	unsigned long	st_blksize;
 	unsigned long	st_blocks;
 	unsigned long	st_atime;
diff --git a/arch/sparc/include/uapi/asm/stat.h b/arch/sparc/include/uapi/asm/stat.h
index b6ec4eb217f7..732c41720e24 100644
--- a/arch/sparc/include/uapi/asm/stat.h
+++ b/arch/sparc/include/uapi/asm/stat.h
@@ -14,12 +14,12 @@ struct stat {
 	uid_t   st_uid;
 	gid_t   st_gid;
 	unsigned int st_rdev;
-	off_t   st_size;
-	time_t  st_atime;
-	time_t  st_mtime;
-	time_t  st_ctime;
-	off_t   st_blksize;
-	off_t   st_blocks;
+	long    st_size;
+	long    st_atime;
+	long    st_mtime;
+	long    st_ctime;
+	long    st_blksize;
+	long    st_blocks;
 	unsigned long  __unused4[2];
 };
 
@@ -57,15 +57,15 @@ struct stat {
 	unsigned short	st_uid;
 	unsigned short	st_gid;
 	unsigned short	st_rdev;
-	off_t		st_size;
-	time_t		st_atime;
+	long		st_size;
+	long		st_atime;
 	unsigned long	st_atime_nsec;
-	time_t		st_mtime;
+	long		st_mtime;
 	unsigned long	st_mtime_nsec;
-	time_t		st_ctime;
+	long		st_ctime;
 	unsigned long	st_ctime_nsec;
-	off_t		st_blksize;
-	off_t		st_blocks;
+	long		st_blksize;
+	long		st_blocks;
 	unsigned long	__unused4[2];
 };
 
-- 
2.20.0

