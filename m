Return-Path: <linux-mips+bounces-4022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E77C91C2F7
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 17:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FE4283129
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 15:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD741C68A0;
	Fri, 28 Jun 2024 15:52:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70731DFFB;
	Fri, 28 Jun 2024 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589974; cv=none; b=YIfaA53G9lz054YJF1WsVG+VxTsQgl4Vnv4/7aV6hF5csRr1QP3oTCv3Tnip+g7S3OZh7FtWhOqKnASZ/AxQUfpNgHuHtEBqTY65hICV5QaeE2r7wLS374b56xvumHoDdFdprZQhsk5f/RYyMeaab4LRcLuQnqlahLhYvUN3P94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589974; c=relaxed/simple;
	bh=AESRoCtdfYIEKI2FzdomGfG8TR8mQBKd5L+uqnwzWp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRq2pPLfljC/yJa3at0gR1nqdOzZr1kUaHx34o+h6tYYKAz5atStKi7FzeJcY/ZzehRVMPO96lrtEUA9k5IowWP/F+e/mfuse7Jyyear+ExCScxqqiGHUi/C3ZPZhFkBU+UYXE9PfBeKgtikRhHwn4wPeTXaNqF7fOCd0DDF/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz13t1719589914t2js4i
X-QQ-Originating-IP: ge8KyYfF/y74egXHDOj1Cmc5ujh0vTQl+zJIQK3W50k=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Jun 2024 23:51:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14412566357318969333
Message-ID: <CD5FFEE4BEA56308+0122a540-e098-4982-9bb1-110b449cbe02@uniontech.com>
Date: Fri, 28 Jun 2024 23:51:53 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: crypto: Clean up useless assignment operations
To: herbert@gondor.apana.org.au
Cc: linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guan Wentao <guanwentao@uniontech.com>,
 davem@davemloft.net, tsbogend@alpha.franken.de
References: <1D248893502B75F5+20240628084117.84264-1-wangyuli@uniontech.com>
From: WangYuli <wangyuli@uniontech.com>
In-Reply-To: <1D248893502B75F5+20240628084117.84264-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1


On 2024/6/28 18:12, Herbert Xu wrote:
 > On Fri, Jun 28, 2024 at 04:41:17PM +0800, WangYuli wrote:
 >> When entering the "len & sizeof(u32)" branch, len must be less than 8.
 >> So after one operation, len must be less than 4.
 >> At this time, "len -= sizeof(u32)" is not necessary for 64-bit CPUs.
 >>
 >> A similar issue has been solved at Loongarch.
 >>
 >> Link: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.10-rc5&id=fea1c949f6ca5059e12de00d0483645debc5b206
 >> Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
 >> Signed-off-by: WangYuli <wangyuli@uniontech.com>
 >> ---
 >>  arch/mips/crypto/crc32-mips.c | 4 ++++
 >>  1 file changed, 4 insertions(+)
 >>
 >> diff --git a/arch/mips/crypto/crc32-mips.c 
b/arch/mips/crypto/crc32-mips.c
 >> index ec6d58008f8e..505d2d897849 100644
 >> --- a/arch/mips/crypto/crc32-mips.c
 >> +++ b/arch/mips/crypto/crc32-mips.c
 >> @@ -94,7 +94,9 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, 
unsigned int len)
 >>
 >>          CRC32(crc, value, w);
 >>          p += sizeof(u32);
 >> +#ifndef CONFIG_64BIT
 >>          len -= sizeof(u32);
 >> +#endif
 >
 > First of all, did you verify that this actually makes a difference?
 > Please post the actual assembly output with and without this patch.

Sure.

The left shows the assembly after applying this patch, while the right 
shows the origin. ( Generated by Clang 17.0.6 )

0000000000000018 <chksum_update>: 0000000000000018 <chksum_update>:
;     ctx->crc = crc32_mips_le_hw(ctx->crc, data, length); ;     
ctx->crc = crc32_mips_le_hw(ctx->crc, data, length);
       18: 08 00 82 8c      lw    $2, 0x8($4) 18: 08 00 82 8c      lw    
$2, 0x8($4)
;     while (len >= sizeof(u64)) { ;     while (len >= sizeof(u64)) {
       1c: 08 00 c1 2c      sltiu    $1, $6, 0x8 <chksum_init+0x8> 1c: 
08 00 c1 2c      sltiu    $1, $6, 0x8 <chksum_init+0x8>
       20: 06 00 20 f8      bnezc    $1, 0x3c <chksum_update+0x24> 20: 
06 00 20 f8      bnezc    $1, 0x3c <chksum_update+0x24>
;     return le64_to_cpu(__get_unaligned_t(__le64, p)); ;     return 
le64_to_cpu(__get_unaligned_t(__le64, p));
       24: 00 00 a3 dc      ld    $3, 0x0($5) 24: 00 00 a3 dc      ld    
$3, 0x0($5)
;         CRC32(crc, value, d); ;         CRC32(crc, value, d);
       28: cf 00 62 7c      <unknown> crc32d v0,v1,v0 28: cf 00 62 
7c      <unknown> crc32d    v0,v1,v0
;         len -= sizeof(u64); ;         len -= sizeof(u64);
       2c: f8 ff c6 24      addiu    $6, $6, -0x8 
<chksumc_digest+0xfffffffffffffce0> 2c: f8 ff c6 24      addiu    $6, 
$6, -0x8 <chksumc_digest+0xfffffffffffffd48>
;     while (len >= sizeof(u64)) { ;     while (len >= sizeof(u64)) {
       30: 08 00 c1 2c      sltiu    $1, $6, 0x8 <chksum_init+0x8> 30: 
08 00 c1 2c      sltiu    $1, $6, 0x8 <chksum_init+0x8>
       34: fb ff 20 10      beqz    $1, 0x24 <chksum_update+0xc> 34: fb 
ff 20 10      beqz    $1, 0x24 <chksum_update+0xc>
       38: 08 00 a5 64      daddiu    $5, $5, 0x8 <chksum_init+0x8> 38: 
08 00 a5 64      daddiu    $5, $5, 0x8 <chksum_init+0x8>
;     if (len & sizeof(u32)) { ;     if (len & sizeof(u32)) {
       3c: 04 00 c1 2c      sltiu    $1, $6, 0x4 <chksum_init+0x4> 3c: 
04 00 c1 2c      sltiu    $1, $6, 0x4 <chksum_init+0x4>
       40: 0a 00 20 10      beqz    $1, 0x6c <chksum_update+0x54> 40: 04 
00 20 f8      bnezc    $1, 0x54 <chksum_update+0x3c>
       44: 03 f8 c3 7c      dext    $3, $6, 0x0, 0x20 
<chksum_update+0x8> ;     return le32_to_cpu(__get_unaligned_t(__le32, p));
;     if (len & sizeof(u16)) { 44: 00 00 a3 8c      lw    $3, 0x0($5)
       48: 02 00 61 30      andi    $1, $3, 0x2 <chksum_init+0x2> 
;         CRC32(crc, value, w);
       4c: 0c 00 20 f8      bnezc    $1, 0x80 <chksum_update+0x68>
;     if (len & sizeof(u8)) { 48: 8f 00 62 7c      <unknown> crc32w    
v0,v1,v0
       50: 01 00 61 30      andi    $1, $3, 0x1 <chksum_init+0x1>
       54: 02 00 20 d8      beqzc    $1, 0x60 <chksum_update+0x48> 
;         len -= sizeof(u32);
;         CRC32(crc, value, b); 4c: fc ff c6 24      addiu    $6, $6, 
-0x4 <chksumc_digest+0xfffffffffffffd4c>
       58: 00 00 a3 90      lbu    $3, 0x0($5) ;         p += sizeof(u32);
50: 04 00 a5 64      daddiu    $5, $5, 0x4 <chksum_init+0x4>
       5c: 0f 00 62 7c      <unknown> crc32b v0,v1,v0 ;     if (len & 
sizeof(u16)) {
54: 03 f8 c3 7c      dext    $3, $6, 0x0, 0x20 <chksum_update+0x8>
;     ctx->crc = crc32_mips_le_hw(ctx->crc, data, length); 58: 02 00 61 
30      andi    $1, $3, 0x2 <chksum_init+0x2>
       60: 08 00 82 ac      sw    $2, 0x8($4) 5c: 03 00 20 d8      
beqzc    $1, 0x6c <chksum_update+0x54>
;     return 0; ;         CRC32(crc, value, h);
       64: 09 00 e0 03      jr $ra 60: 00 00 a6 94      lhu    $6, 0x0($5)
       68: 00 00 02 64      daddiu    $2, $zero, 0x0 <chksum_init>
;     return le32_to_cpu(__get_unaligned_t(__le32, p)); 64: 4f 00 c2 
7c      <unknown> crc32h    v0,a2,v0
       6c: 00 00 a6 8c      lw    $6, 0x0($5)
;         CRC32(crc, value, w); ;         p += sizeof(u16);
       70: 8f 00 c2 7c      <unknown> crc32w v0,a2,v0 68: 02 00 a5 
64      daddiu    $5, $5, 0x2 <chksum_init+0x2>
;     if (len & sizeof(u16)) { ;     if (len & sizeof(u8)) {
       74: 02 00 61 30      andi    $1, $3, 0x2 <chksum_init+0x2> 6c: 01 
00 61 30      andi    $1, $3, 0x1 <chksum_init+0x1>
       78: f5 ff 20 10      beqz    $1, 0x50 <chksum_update+0x38> 70: 02 
00 20 d8      beqzc    $1, 0x7c <chksum_update+0x64>
       7c: 04 00 a5 64      daddiu    $5, $5, 0x4 <chksum_init+0x4>
;         CRC32(crc, value, h); ;         CRC32(crc, value, b);
       80: 00 00 a6 94      lhu    $6, 0x0($5) 74: 00 00 a3 90      
lbu    $3, 0x0($5)

       84: 4f 00 c2 7c      <unknown> crc32h v0,a2,v0 78: 0f 00 62 
7c      <unknown> crc32b    v0,v1,v0

;     if (len & sizeof(u8)) { ;     ctx->crc = 
crc32_mips_le_hw(ctx->crc, data, length);
       88: 01 00 61 30      andi    $1, $3, 0x1 <chksum_init+0x1> 7c: 08 
00 82 ac      sw    $2, 0x8($4)
       8c: f4 ff 20 10      beqz    $1, 0x60 <chksum_update+0x48> ;     
return 0;
       90: 02 00 a5 64      daddiu    $5, $5, 0x2 <chksum_init+0x2> 80: 
09 00 e0 03      jr    $ra
       94: 00 00 00 08      j    0x0 <chksum_init> 84: 00 00 02 64      
daddiu    $2, $zero, 0x0 <chksum_init>


In our testing, this assignment operation affects Clang's code expansion 
and instruction reordering.

This redundant assignment operation confuses Clang and prevents us from 
obtaining optimized

assembly code.


I extracted the 'crc32_mips_le_hw()' function as a user-mode demo to 
analyze the assembly code

generated for it on MIPS64.

Link: https://godbolt.org/z/r4dGbhTGf



As you can see, regardless of the Clang or GCC version, this redundant 
operation affects the generated

assembly code.
 >
 > If it does make a difference, you should avoid doing ifdefs as they
 > are more likely to cause build failures.  Instead do something like
 >
 >         if (!IS_ENABLED(CONFIG_64BIT))
 >             len -= sizeof(u32);
Okay, I'll send a Patch V2 to fix this and update the commit message 
based on above.
 >
 >
 > Cheers,

-- 
WangYuli <wangyuli@uniontech.com>



