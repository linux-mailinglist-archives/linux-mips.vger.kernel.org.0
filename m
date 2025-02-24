Return-Path: <linux-mips+bounces-7914-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74CA427C0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 17:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77E51889182
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 16:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2E92580E7;
	Mon, 24 Feb 2025 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIgbtxU4"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B83DBB6
	for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414105; cv=none; b=BPoeXLkifAyO22K3BYOZGRjKlPn9kea5aFgUPtX1OiRj+PXeejKdnFopbsSI0v+EWnC8wCNOcBFLR7xXINCyKb8ztpmemcHjuoE0MbfNq3Va4nfB70YCrGqON9hzWnppXI+po0PEJxIPJteZpBUMR+FS3xJ7IImC4ede8kJ+qYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414105; c=relaxed/simple;
	bh=Bcw1wDQoOeot8tpK5GRPmkl82bK+1+f4v0hjc/unh40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idLpgVEPqqVUcezlGfxovfG8sPdY20qp9trLLLNAcPDwiPfYBUzkpWs2us2gxhllvyQCQk1FKX77PfIG0FavCeFAHPMxl5XJdCQHyh0Lwvho8lJewVs2plKVHDLmCXPoqzsEPs3Z6ZiuF4N/iU0ZBGq/g7XRROutYAy/h77620s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIgbtxU4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740414102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
	b=FIgbtxU4QdIpfzJgL7vvg+eH5/aDWge64AEDUZmx8+bxMvdTGabsXPvDHCAP28C2o9lhv7
	nlyek7bzxnsSGxmChSnfjkFSaHGX6WflHTKkX3WVbDLS6JjpTft4yljWlXEMwPdXeAvTA9
	2WQm5qtopaY2a0lgwc+2yeow5MuZ7eM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-CQ2c_uOLOqOsp7dDC0wESw-1; Mon, 24 Feb 2025 11:21:40 -0500
X-MC-Unique: CQ2c_uOLOqOsp7dDC0wESw-1
X-Mimecast-MFC-AGG-ID: CQ2c_uOLOqOsp7dDC0wESw_1740414099
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so524572866b.2
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 08:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414098; x=1741018898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
        b=Tlmm6WuIRHG+gw+VuEkqaVTwFxbkCIDr0bfZx00ZGey/Fl08Hn9ySMVKfSZIEFBoz6
         5gLVh8quLP4eodrMndXg7HnBIilV55pYbLYx3wSy6R82Cq3s2SO4ooT2HEydHNsAwvdH
         tKZIZvJ+K5/Ba+HTdjQgIZUbXdi67ZR46c9FEwrBh/aq0hBHxBkze6eUw1hUwF7zoPsk
         9Vl2gVDSChC5Mj1EV3ByyB7UDEgTxxs6c0LsMrhxtCYofWuIVww4c9y8okjhhzGYWR/x
         KfItAcSyU12mmMCUva6HUrV3UzNdmMDCxpzCzoMBSTm0+0uJLenzutWxSGUNrq5b21VZ
         mCog==
X-Forwarded-Encrypted: i=1; AJvYcCWRTwIUwpRMrGMkXbzdG6DKn2BuO+0bFgB6HMtHJ96lF//76RiHfJimhB+DA0zmSy6g65c6MYwg0BbR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFjpnDOBJTxTI+1Yf+MQsj+8Y1mld47Bi3i97sH8s1D5nr84Z
	aF3ltqxfi4BtMibQUHsdhUsV4TzbwcUxIlK4doNg/I0SFPkyzqLOm7hi9qfHjpz4h35pi2/H5JZ
	5dcpTxoEVr3wg/AOL/QfMV+KHkpjDsnpAL+s5vreH5873RVAu/EQyQKGiMw==
X-Gm-Gg: ASbGncs+i7sHAnwVW3xDhnRl6P4dGw/uFwDSSQ7MDb2/kjzZbQD22DLn/pWru5zmNzk
	M5jcaEhLElLSlXEDe/j7nPo7kLxAkPVQd0llEaehKSK2bjufTLCpybSvXKPPT8Zvu7JTRlCRvg1
	JAZWM6Uj0WL8Imz4qzq+PhrCuGJkxNLXMpbzrkZ0fP6cVM+5bxjQWWAQpVe8ibD4RJDS05t4Atu
	kzU06VE9VikypQhMpz6oi3nAFMTEINSLfrsEVkQYwYvP0+t8GLiMMdPmZyrnt7zlGNMwa1Qi81O
	hnYtJZLvkelaE8EYR+kfSZ+srBFddF+4CvA=
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391790966b.7.1740414098549;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVIc+JAiSWQcjvyNYMJZbdBLdYt9qKN3p7wrynJ8JvTXd/WAhRLvwN0eiscAH5n9vkRsMuqA==
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391785866b.7.1740414098057;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abec4c14a27sm95755766b.45.2025.02.24.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:21:37 -0800 (PST)
Date: Mon, 24 Feb 2025 17:21:36 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Theodore Tso <tytso@mit.edu>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <snfyyqhdzevotzcivrcd7uqpaobnslxgddd26s6nc3bb7ey3g4@posoztx4qrtm>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>

On 2025-02-24 12:32:17, Christian Brauner wrote:
> On Fri, Feb 21, 2025 at 08:15:24PM +0100, Amir Goldstein wrote:
> > On Fri, Feb 21, 2025 at 7:13 PM Darrick J. Wong <djwong@kernel.org> wrote:
> > >
> > > On Tue, Feb 11, 2025 at 06:22:47PM +0100, Andrey Albershteyn wrote:
> > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > >
> > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > path to the child together with struct fsxattr.
> > > >
> > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > that file don't need to be open as we can reference it with a path
> > > > instead of fd. By having this we can manipulated inode extended
> > > > attributes not only on regular files but also on special ones. This
> > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > >
> > > > This patch adds two new syscalls which allows userspace to get/set
> > > > extended inode attributes on special files by using parent directory
> > > > and a path - *at() like syscall.
> > > >
> > > > Also, as vfs_fileattr_set() is now will be called on special files
> > > > too, let's forbid any other attributes except projid and nextents
> > > > (symlink can have an extent).
> > > >
> > > > CC: linux-api@vger.kernel.org
> > > > CC: linux-fsdevel@vger.kernel.org
> > > > CC: linux-xfs@vger.kernel.org
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > ---
> > > > v1:
> > > > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> > > >
> > > > Previous discussion:
> > > > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> > > >
> > > > XFS has project quotas which could be attached to a directory. All
> > > > new inodes in these directories inherit project ID set on parent
> > > > directory.
> > > >
> > > > The project is created from userspace by opening and calling
> > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > > with empty project ID. Those inodes then are not shown in the quota
> > > > accounting but still exist in the directory. Moreover, in the case
> > > > when special files are created in the directory with already
> > > > existing project quota, these inode inherit extended attributes.
> > > > This than leaves them with these attributes without the possibility
> > > > to clear them out. This, in turn, prevents userspace from
> > > > re-creating quota project on these existing files.
> > > > ---
> > > > Changes in v3:
> > > > - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> > > > - Remove unnecessary "same filesystem" check
> > > > - Use CLASS() instead of directly calling fdget/fdput
> > > > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> > > > ---
> > > >  arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/arm/tools/syscall.tbl                  |  2 +
> > > >  arch/arm64/tools/syscall_32.tbl             |  2 +
> > > >  arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
> > > >  arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
> > > >  arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
> > > >  arch/s390/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/sh/kernel/syscalls/syscall.tbl         |  2 +
> > > >  arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
> > > >  arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
> > > >  fs/inode.c                                  | 75 +++++++++++++++++++++++++++++
> > > >  fs/ioctl.c                                  | 16 +++++-
> > > >  include/linux/fileattr.h                    |  1 +
> > > >  include/linux/syscalls.h                    |  4 ++
> > > >  include/uapi/asm-generic/unistd.h           |  8 ++-
> > > >  21 files changed, 133 insertions(+), 3 deletions(-)
> > > >
> > >
> > > <cut to the syscall definitions>
> > >
> > > > diff --git a/fs/inode.c b/fs/inode.c
> > > > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf541a86978b290411ec 100644
> > > > --- a/fs/inode.c
> > > > +++ b/fs/inode.c
> > > > @@ -23,6 +23,9 @@
> > > >  #include <linux/rw_hint.h>
> > > >  #include <linux/seq_file.h>
> > > >  #include <linux/debugfs.h>
> > > > +#include <linux/syscalls.h>
> > > > +#include <linux/fileattr.h>
> > > > +#include <linux/namei.h>
> > > >  #include <trace/events/writeback.h>
> > > >  #define CREATE_TRACE_POINTS
> > > >  #include <trace/events/timestamp.h>
> > > > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> > > >       return mode & ~S_ISGID;
> > > >  }
> > > >  EXPORT_SYMBOL(mode_strip_sgid);
> > > > +
> > > > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > > > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
> > >
> > > Should the kernel require userspace to pass the size of the fsx buffer?
> > > That way we avoid needing to rev the interface when we decide to grow
> > > the structure.
> 
> Please version the struct by size as we do for clone3(),
> mount_setattr(), listmount()'s struct mnt_id_req, sched_setattr(), all
> the new xattrat*() system calls and a host of others. So laying out the
> struct 64bit and passing a size alongside it.
> 
> This is all handled by copy_struct_from_user() and copy_struct_to_user()
> so nothing to reinvent. And it's easy to copy from existing system
> calls.
> 

Oh, thanks for pointing to these, will use them.

-- 
- Andrey


