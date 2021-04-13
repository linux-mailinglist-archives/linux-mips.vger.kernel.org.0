Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA5C35E314
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 17:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhDMPod (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 11:44:33 -0400
Received: from mout.gmx.net ([212.227.15.15]:37459 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231601AbhDMPoc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 11:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618328635;
        bh=8454NEAX+UWdq5h/O6gluQtx4qvQS488lfVBiEurf6g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Ml8RgQ9EatnrmP3tbX9Vol7UjxwIESHXyOfBmUBvJ0DbhtS8wkj9Xt/PuV38+L6FM
         27u981UD2IxNHF2wHRqpGghv49XktsyGVSwFO3l3gBbFOQB0Mv/jwzTsbJo3fF7ALt
         +BWLdMkc9+6fUBXmEqaHMUeLklGyeTl5PhJJNN2Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.89]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1ldvxP09BM-010sVZ; Tue, 13
 Apr 2021 17:43:55 +0200
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To:     Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20210412085545.2595431-1-hch@lst.de>
 <20210412085545.2595431-5-hch@lst.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <da779585-60c6-2f4b-feaf-db45e1eef262@gmx.de>
Date:   Tue, 13 Apr 2021 17:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412085545.2595431-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KD8LpRrc2QPgXmMyD3O08nojYF3jtvSiAgD+AleeC0bMsp12wCR
 50h8ZVLsX6MO7mwX/siYcMto3L/ahncIIvwWLHzwbKl7O64s6iV3anCZWD82zdRQ+nKkHds
 DQSaDvehbWM5wMrjQOfVYiXSy/q48r28CZvsKx8gPxlF/A3Vr1/+DrlN6J+6ekjvv//xIGz
 mqtO/YJ37Jdggro6aiZoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4VIm2It02fI=:GOASkM9L/4wKw/UXoact06
 6GmMLN5oHy22F5oC9+QzlA6ijE8oV/DHgF3217U96zs4cWVYSQEKsG79C/qVuDyXBHTY8FBDc
 QDu5OuiH9mbYFhX2h05HUVqCwWxfExKX5CxWy+4dptafM2PnN1iqH+8B6w2XqBYmR+J+nL2o2
 3OrM+d30gpJYxBgEOqFGizcpmJnHWHnbbZ40fU3pQwaW/akqCrEZcrbmur4+t0Zb9aaP6JfOi
 XK27Mz91wP7kxeGgN1RY5ruPAxKw29gnrIJnacEravfDZF/Vk8FxORdcRBGOFSNzY71OJNHfg
 8CmVukREs6SwlP7lz3zSxMwNjfqHIm9dMsFE+fl6ndTTYpx2yLBCh1baJCKPwUNTKpOy7KeSG
 p3L+oZNDh8dTSZGzfDs/p3EWHGa1kvWT2mXhB3MBa5T+Cidoasd3w7owfnglxWShwhsJeW4qH
 ztpxlqlGBe5kl8gBP1oM/Un1YS9UrYTbs+L596qjBaf/BAvLVKBzEV1OE2YT4aeT2tLrkajNC
 TFooYEJCxQlxmdgImZY9tpmqqDUR8XS3XZGul0KDXmp4VfS6gHowCYPQgoz/syRuyiVFYx1tZ
 MUWzMkk0Fx0QbRFIm0ahiEY16q3q9nuXeLgok62KKElHWVj2zDFshRmqI/rUc/EyZS6BgQ2x7
 9MKv7XmDO+bu2jk0xmhRAhk2nC3ekVXpcBYWqvQUDT+1lC/u9XaW63tcURls5hMHBVlopSGRu
 oUW5vx7Rszv5jyRsY8sfoeE1Y57QMUewICfdK4NpgOVQoFN1g7FnbZWnHyUUnCkrDyGvTcAm/
 2shXgGqFXa5D8FIM8SZE/ybWXkWJAbvpbwnOUO2YgwZpA4q27+QdxqQ8MDQDpA2n75b/h3v8p
 IeKWL6MIh40OgvW2+4ZrIQIa8EreCKtf7zliy2XMz9qwAD+EzM7xpdZFdqI8c/j6HNqIB4ijb
 I3A30ve30ZvCIEOtKNSNmJTnpB/rE1twkjXuTqclBCYDW6QVsUgSASjqpxfp+dN/q0HTWXoJ+
 4PoQjSJElZqfd90fFs8NiqQa+TfUXR1b9MQp8E8sCw4B3m5q5xUSeCnNbTahSe7vpMZ3HG8RX
 ispZaaAVI04S+mJUgUbrdyh9PPaKvRbNWKAFJSiUe4T458SLzXyH8gdGXf+Ds/AS8DdY4zK+R
 ei0ozDtdyu2/hYYnu//R7OPVYrmo3l5zYPl0g1KgD+qC3QvqQ4++y41zkU+2ypT0YPc3c=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/12/21 10:55 AM, Christoph Hellwig wrote:
> The F_GETLK64/F_SETLK64/F_SETLKW64 commands are only implemented for
> 32-bit syscall APIs, but we also need them for compat handling on 64-bit
> kernels.

Ok.

> Given that redefining them is rather error prone, as shown by parisc
> getting the opcodes wrong currently, just use the existing definitions
> for the compat handling.

Can you please show me where parisc gets it currently wrong?
I'm somehow blind to see it and of course I'd like to fix it in
stable kernel series if that's true...

Other than that, thanks for this cleanup!
You may add:

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge


> In theory we could try to hide them from userspace; but given that only
> MIPS manages to properly do that while the asm-generic version used by
> most architectures relies on a Kconfig symbol that is never set by
> userspace there doesn't seem to be much of a point to even bother.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/arm64/include/asm/compat.h        | 4 ----
>   arch/mips/include/asm/compat.h         | 4 ----
>   arch/mips/include/uapi/asm/fcntl.h     | 2 --
>   arch/powerpc/include/asm/compat.h      | 4 ----
>   arch/s390/include/asm/compat.h         | 4 ----
>   arch/sparc/include/asm/compat.h        | 4 ----
>   arch/x86/include/asm/compat.h          | 4 ----
>   include/uapi/asm-generic/fcntl.h       | 2 --
>   tools/include/uapi/asm-generic/fcntl.h | 2 --
>   9 files changed, 30 deletions(-)
>
> diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/co=
mpat.h
> index 23a9fb73c04ff8..a5fe4558a6ecc0 100644
> --- a/arch/arm64/include/asm/compat.h
> +++ b/arch/arm64/include/asm/compat.h
> @@ -74,10 +74,6 @@ struct compat_flock {
>   	compat_pid_t	l_pid;
>   };
>
> -#define F_GETLK64	12	/*  using 'struct flock64' */
> -#define F_SETLK64	13
> -#define F_SETLKW64	14
> -
>   struct compat_flock64 {
>   	short		l_type;
>   	short		l_whence;
> diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/comp=
at.h
> index 65975712a22dcf..a13436e91c3938 100644
> --- a/arch/mips/include/asm/compat.h
> +++ b/arch/mips/include/asm/compat.h
> @@ -60,10 +60,6 @@ struct compat_flock {
>   	s32		pad[4];
>   };
>
> -#define F_GETLK64	33
> -#define F_SETLK64	34
> -#define F_SETLKW64	35
> -
>   struct compat_flock64 {
>   	short		l_type;
>   	short		l_whence;
> diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi=
/asm/fcntl.h
> index 9e44ac810db94d..1769fc50d35f0e 100644
> --- a/arch/mips/include/uapi/asm/fcntl.h
> +++ b/arch/mips/include/uapi/asm/fcntl.h
> @@ -44,11 +44,9 @@
>   #define F_SETOWN	24	/*  for sockets. */
>   #define F_GETOWN	23	/*  for sockets. */
>
> -#ifndef __mips64
>   #define F_GETLK64	33	/*  using 'struct flock64' */
>   #define F_SETLK64	34
>   #define F_SETLKW64	35
> -#endif
>
>   #if _MIPS_SIM !=3D _MIPS_SIM_ABI64
>   #define __ARCH_FLOCK_EXTRA_SYSID	long l_sysid;
> diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/as=
m/compat.h
> index 9191fc29e6ed11..b0f2c3f7fe45a5 100644
> --- a/arch/powerpc/include/asm/compat.h
> +++ b/arch/powerpc/include/asm/compat.h
> @@ -56,10 +56,6 @@ struct compat_flock {
>   	compat_pid_t	l_pid;
>   };
>
> -#define F_GETLK64	12	/*  using 'struct flock64' */
> -#define F_SETLK64	13
> -#define F_SETLKW64	14
> -
>   struct compat_flock64 {
>   	short		l_type;
>   	short		l_whence;
> diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/comp=
at.h
> index ea5b9c34b7be5b..e0896758779da4 100644
> --- a/arch/s390/include/asm/compat.h
> +++ b/arch/s390/include/asm/compat.h
> @@ -111,10 +111,6 @@ struct compat_flock {
>   	compat_pid_t	l_pid;
>   };
>
> -#define F_GETLK64       12
> -#define F_SETLK64       13
> -#define F_SETLKW64      14
> -
>   struct compat_flock64 {
>   	short		l_type;
>   	short		l_whence;
> diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/co=
mpat.h
> index b85842cda99fe0..4524997424043f 100644
> --- a/arch/sparc/include/asm/compat.h
> +++ b/arch/sparc/include/asm/compat.h
> @@ -85,10 +85,6 @@ struct compat_flock {
>   	short		__unused;
>   };
>
> -#define F_GETLK64	12
> -#define F_SETLK64	13
> -#define F_SETLKW64	14
> -
>   struct compat_flock64 {
>   	short		l_type;
>   	short		l_whence;
> diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat=
.h
> index be09c7eac89f09..b1691cf148be10 100644
> --- a/arch/x86/include/asm/compat.h
> +++ b/arch/x86/include/asm/compat.h
> @@ -59,10 +59,6 @@ struct compat_flock {
>   	compat_pid_t	l_pid;
>   };
>
> -#define F_GETLK64	12	/*  using 'struct flock64' */
> -#define F_SETLK64	13
> -#define F_SETLKW64	14
> -
>   /*
>    * IA32 uses 4 byte alignment for 64 bit quantities,
>    * so we need to pack this structure.
> diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic=
/fcntl.h
> index 7e714443a8d2e3..6430a2f8023fc3 100644
> --- a/include/uapi/asm-generic/fcntl.h
> +++ b/include/uapi/asm-generic/fcntl.h
> @@ -116,13 +116,11 @@
>   #define F_GETSIG	11	/* for sockets. */
>   #endif
>
> -#ifndef CONFIG_64BIT
>   #ifndef F_GETLK64
>   #define F_GETLK64	12	/*  using 'struct flock64' */
>   #define F_SETLK64	13
>   #define F_SETLKW64	14
>   #endif
> -#endif
>
>   #ifndef F_SETOWN_EX
>   #define F_SETOWN_EX	15
> diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi=
/asm-generic/fcntl.h
> index bf961a71802e0e..6e16722026f39a 100644
> --- a/tools/include/uapi/asm-generic/fcntl.h
> +++ b/tools/include/uapi/asm-generic/fcntl.h
> @@ -115,13 +115,11 @@
>   #define F_GETSIG	11	/* for sockets. */
>   #endif
>
> -#ifndef CONFIG_64BIT
>   #ifndef F_GETLK64
>   #define F_GETLK64	12	/*  using 'struct flock64' */
>   #define F_SETLK64	13
>   #define F_SETLKW64	14
>   #endif
> -#endif
>
>   #ifndef F_SETOWN_EX
>   #define F_SETOWN_EX	15
>

