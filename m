Return-Path: <linux-mips+bounces-14082-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AdWBGeS1GnGvQcAu9opvQ
	(envelope-from <linux-mips+bounces-14082-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 07:13:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA113A9D9F
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 07:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096C23041A56
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2026 05:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5CE377ECE;
	Tue,  7 Apr 2026 05:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qyr3QbM9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685434E75E
	for <linux-mips@vger.kernel.org>; Tue,  7 Apr 2026 05:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775538777; cv=pass; b=n2O7f3EcX+jPw/qkEPoBWkKMrx8tTLbtIcbqsmk7yo80ljrKW238H8sfxnBBxUBrs7/TKP3rqfML3qgjQaLsfYTTg14ZdDTSWRMtIv3AeYPEmPo19VRoEJVYkNgyzllSFZXc/rgAhyjgmWxCvYSux5f4XMmGetergD9eSGava2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775538777; c=relaxed/simple;
	bh=/tAeAVFfLa3BAJdaw8XFGiTq1kAgqBc+qqoSggDEA+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAl4ZmwGHKPomgQxje4UM+HCBLnBj66fpmupo2FzdP/oum01fQBcJh9XdXqFUboU+OBqDy/0FmBGycGrDeE2u7wb6GASxShHqNWphUceX0qlD6QiSQnFZR+2EeRDYeCFivaUpIPrq9Vkl89dLPwiVs9NOL81h1raiKr27SPZty0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qyr3QbM9; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b0b260d309so267725ad.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Apr 2026 22:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775538774; cv=none;
        d=google.com; s=arc-20240605;
        b=RmVMdaFtC6grASp7/ZIuUj/uc2besp3jkjQrNbnmgxQSnuj/gw8f+YHCbxindiMLvf
         X5bnSvAOcsVCJbjt3E7uBLp/TnYKEa/XmAu5zispiSChzbSdKC083SuBMVgqzaRA7akY
         Hq7wB0gQ9lMzW5gOnLsihoxNe6Cfv7yfmJLQYyqWalaHssnJNuhbmQOV2u09jSqkU3+B
         BaGjltYlhnxOf2Hmn9FRf/fJ9EGOdxOTO+QDmD7F2UI3RXk0wTzU+qnVEdPKMQW9RkYK
         b0J6TvRQOc7d0wNGW29oWsHgxLm82PObX0Agw/1Z36Dy3tqyQGjnpBXEpX4tXXAkjjaV
         vXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        fh=twczp0JmxB3kdde5EO2MIwnICi3J7u7gWRc/L4VUiYY=;
        b=eEh2pN6dQ8sus+d89NReaQ7vUPEoUxWTB8AqXkB3rvWzzl42wN09q2zoo3qrKY51LE
         i1W24NRR1uGO7RyA82TTMNZMW2TWyxZSp8GBA+L58QwPnYdqXAtetdWyB50nryEedC9E
         CoFvnD+S3K+DCTGosl7kbMqxusBmxOxUKLRInUnonpNbPmxonYdBRUVLIEOrJRkJ8SPz
         FJE5Qs7b90bwGRlgINUAKUz2AAG0mmhtDvZSIkdvLPwIKm1p+OakOgZtgiMHFMMjObsv
         o9cLUTbgfxo1zRRHtFbFs4oJD3hYeRHnUUuaGWVLJLEkt0ZNqbvf3vdCkaI0jDypHfqa
         bd2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775538774; x=1776143574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        b=Qyr3QbM9E4AF1E4qO7OutWwmPzn3fFnqZcJTR+adf24SWaNa0Dzn/9xPGNuULeG96Z
         /ShFZS6Wo9s14Kh89E+qh2wIA7uITk2WGKpNKsH3tWyJKeMBdVIvKCtGeo8jWhxwuDZR
         ZDbQgG1Hktekm/jzXch3pKfD6C+KIX4Yj4wFtuyaN9mhMXYLEDsfzJGP378DKTlixvHO
         RtTQJZdsYFmhg3b1CtJadY6IRirxKyF5GEOtXdmckmjBYjeAqirDcdsaejEp2Wp4UxxX
         9/O1bWLe1ZuJjatcNPK+k88vO+/OmSQh3j+/ZI9oVw2o904CP6TSGCpPIWf5tH8qALO0
         pSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775538774; x=1776143574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xP9Cc2QEXzoralI8Q3/pv4kXEl+6Bhb4StE3Cccy/K8=;
        b=PK071P6jKeZ2uJAiVZW2ToqeBQuu/dNrZC2n2OVZ5DRFuUgk4jJF7OkaQXdfa8hJTD
         u02CqWPA8BaMANjkkldjiItUS8r+UOHHFgSEQiSRLjHIMscDBqnS2dEeu2XTJbzBsyLB
         Lx8Qia6RmV+eRO7JSD3sLjk2VZsQ2WTvH8JCSnA0CTuWwUQCk/+q4+3k5oZbdy/SREBk
         gjwBKU0UPar8chZ3tINBFSq0arXt8OnG4V3rvrlrxvziRvzUALD/hIKfjD4K3OdehGox
         5y/J1a3eZm/NMqyia6F+zO5oYTNNpnaAHzeUBBtk/NJhatF0fj/DFTKRPf9tdkpGScGG
         YK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlGtl2zAIEcDlngYXOD3p/5IZFy40C8Zx0oUrXx8QvMvuzSLsbrHTVvTO3arlMInUPr9/LnOSIwRrb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLchD4oDuzgB7L3+fBO+f7l1HwpvcCqHGlh6O9bqY7u+49INFy
	Awv6NfjaeQWmXW2i61ZhnB5sDh2D3zdZeag0e3M+o1LQ0FKvdi6D9EmnLqMYpLQoXOQxi7+dvw4
	ovVaF2wi7cm8wFQ+5iUkoL1kg3AU6P7GL2F1Ivpjl
X-Gm-Gg: AeBDies1JdaHvSVOUptBtgd3AwUBqIYuSQtjTezIUEA6WmLitsdjlibmUmcs5Ali4Mv
	nSqOA94qgTBFSDVn910Bo03tm/zziANoenNn83qdvxlHDl9Ps2NRefPNYK5+bZfbPZin54GdBtR
	fjt5tHgX/kyKNIyrA8MskVIvFVjurDzaNx8i+yyuYM8ZZZ3qVqotX/WKRGP1OZmalkiOtZQtz4N
	rEklGbK0qZupSBZdahEEnQV5c1HWb1y4kE7O8M7dG0iIoxMAKAF3NHZEJ6sr22McUyeuE4Valj9
	MFvJBhjg
X-Received: by 2002:a17:902:e852:b0:271:9873:80d9 with SMTP id
 d9443c01a7336-2b283fbe6bdmr8531405ad.7.1775538773093; Mon, 06 Apr 2026
 22:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202604070917.ZVd6Ugz4-lkp@intel.com>
In-Reply-To: <202604070917.ZVd6Ugz4-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Apr 2026 22:12:41 -0700
X-Gm-Features: AQROBzBKvQqVQNICwhE1RilQY2nY6Rrqn-aYKRpKX9DBeQSfK51lDsGdw4UTVjo
Message-ID: <CAP-5=fVBZPBz6J1omfvSS4JLkueRGqCdouLji6gsFLTeu9nJTw@mail.gmail.com>
Subject: Re: include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy'
 reading 4 bytes from a region of size 0
To: kernel test robot <lkp@intel.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14082-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:email]
X-Rspamd-Queue-Id: 9DA113A9D9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 9:03=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
> commit: a339671db64b12bb02492557d2b0658811286277 vdso: Switch get/put_una=
ligned() from packed struct to memcpy()
> date:   3 months ago
> config: mips-randconfig-r111-20260406 (https://download.01.org/0day-ci/ar=
chive/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed stru=
ct to memcpy()")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604070917.ZVd6Ugz4-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/byteorder/little_endian.h:5,
>                     from arch/mips/include/uapi/asm/byteorder.h:15,
>                     from arch/mips/include/asm/bitops.h:21,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from arch/mips/boot/compressed/decompress.c:14:
>    In function 'get_unaligned_le32',
>        inlined from 'decompress_kernel' at arch/mips/boot/compressed/deco=
mpress.c:113:16:
> >> include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 0 [-Wstringop-overread]
>       23 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       24 |                          sizeof(__get_unaligned_val));        =
          \
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: in definitio=
n of macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    include/linux/unaligned.h:23:28: note: in expansion of macro '__get_un=
aligned_t'
>       23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
>          |                            ^~~~~~~~~~~~~~~~~
>    In file included from arch/mips/boot/compressed/decompress.c:22:
>    arch/mips/boot/compressed/decompress.h: In function 'decompress_kernel=
':
>    arch/mips/boot/compressed/decompress.h:6:39: note: at offset -4 into s=
ource object '__image_end' of size [0, 2147483647]
>        6 | extern unsigned char __image_begin[], __image_end[];
>          |                                       ^~~~~~~~~~~

I wonder if in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/mips/boot/compressed/decompress.c#n113
```
image_size =3D get_unaligned_le32((void *)__image_end - 4);
```
would be better as:
```
image_size =3D get_unaligned_le32((void *)__image_begin + zimage_size - 4);
```
so that the code isn't negatively indexing an array.

Thanks,
Ian

>
> vim +/__builtin_memcpy +23 include/vdso/unaligned.h
>
>      6
>      7  /**
>      8   * __get_unaligned_t - read an unaligned value from memory.
>      9   * @type:       the type to load from the pointer.
>     10   * @ptr:        the pointer to load from.
>     11   *
>     12   * Use memcpy to affect an unaligned type sized load avoiding und=
efined behavior
>     13   * from approaches like type punning that require -fno-strict-ali=
asing in order
>     14   * to be correct. As type may be const, use __unqual_scalar_typeo=
f to map to a
>     15   * non-const type - you can't memcpy into a const type. The
>     16   * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its req=
uired
>     17   * expression rather than type, a pointer is used to avoid warnin=
gs about mixing
>     18   * the use of 0 and NULL. The void* cast silences ubsan warnings.
>     19   */
>     20  #define __get_unaligned_t(type, ptr) ({                          =
       \
>     21          type *__get_unaligned_ctrl_type __always_unused =3D NULL;=
         \
>     22          __unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_=
unaligned_val; \
>   > 23          __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),    =
       \
>     24                           sizeof(__get_unaligned_val));           =
       \
>     25          __get_unaligned_val;                                     =
       \
>     26  })
>     27
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

