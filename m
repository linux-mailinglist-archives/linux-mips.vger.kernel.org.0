Return-Path: <linux-mips+bounces-6196-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F519A589C
	for <lists+linux-mips@lfdr.de>; Mon, 21 Oct 2024 03:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65871F220F7
	for <lists+linux-mips@lfdr.de>; Mon, 21 Oct 2024 01:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5721C10A1E;
	Mon, 21 Oct 2024 01:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Q8xQdhC9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C0C256E;
	Mon, 21 Oct 2024 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729475323; cv=none; b=QsGbXzGLtTKXE38fM4kr6mS828jt7ea3foLMWmXqZSVDx8+fWOUx0fWt2zujLpz83X9TNFiVCldjJmoxxTv/Iz7lGtsgU31gU731tFlsyHvy8k9cXJWXd+iAXKJrS7iF/FqPcDEZKcj/Vh1ohW+bJmnGlSk75Gi43E9YNxFNIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729475323; c=relaxed/simple;
	bh=g7Oz2WchqaPxIcn3/FbwuwteX1Z14I41x36ekLkSuHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBzOXMmBg6COj1pILOzob1rckq+LJApJMqQBYS+2heZVexNe5nQQnjk3rJ0duSmnCp1HYMM4E94jAWSALkP5tMRfWuGMduapj1QnRRCYnMGBbokQKGARV0/fpRKZxyM31vxeDW+0AHcOt3nv2QEIm01xP8ndLj1VUAk4kUePb8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q8xQdhC9; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729475272;
	bh=3Jb3+8m3q5GqSoRa3aSjH0BmD/kHkoSd7GPyOJ35dOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Q8xQdhC9TxXGovN06qZI/avjNXk+9M3f9bN73SOxPnWdQNFtjBRfsaEkT9KxbYbzR
	 iJb+D0ZwPx8L4PPzDv/VWyO2FEUy2ky+mN0Zggpl2rYlRL4NkbF40c86ZsgX7CCR8K
	 CCNXNVdcN2jdylZfVMMb3+2yo81+KrfELJxmVuxs=
X-QQ-mid: bizesmtp80t1729475266thpnflk4
X-QQ-Originating-IP: sLITKTob2X6UQdBdGgosOb3ERsqJEfUTqINTPTS43QY=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 21 Oct 2024 09:47:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15121724753342584298
Message-ID: <86C0A4FFA98AE1E7+ac00f3f7-866f-4735-a361-a7119aaa3eb0@uniontech.com>
Date: Mon, 21 Oct 2024 09:47:45 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: mips/crc32 - fix the CRC32C implementation
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guan Wentao <guanwentao@uniontech.com>, herbert@gondor.apana.org.au,
 davem@davemloft.net, tsbogend@alpha.franken.de
References: <20241020180258.8060-1-ebiggers@kernel.org>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
In-Reply-To: <20241020180258.8060-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MBN1Gf7pvZQZ6dfWcrTXiKX9h10oAehlD0N/mMsfI82cSjBbongspMb+
	8cRJRRugBDCekNeez40gHMAq8oMcctwDF6RVoecCtI4/M54Vw8XUvQ7JQlleY84jT0TdR8X
	JVZ7QvpY0CamyTAEvfuWovNwjp1ZfZNvOjDW4PKBWWf+vFtLRyZslsVr8KiBaq4tsmCGkar
	IJEcvYVhS94H2USwAFAB5hJXovQccHS32Af3tJT5npfHDhoS3HET3NBJrHpoP4n1Sn1JkWL
	OsKt29YOlVNEXgBWpIcPTacxZhIlWz33wQgbZ2xLfCiwMJydPwsxY8F1dsL3OOtWEl35/Ds
	jGY452DmV3NdxLjc/2aqirMKK3LjxpryrGS6xt6bWsXF1c8qIbzEkR0tNNKul4eX93e2Fuo
	NDGzFuy33DJjs6QXT5/pDp1jf2Y4LGcUT3PJSVqswXtV5Jfpt7nFs/dMLZurPgpLXjG7ti9
	I1Bg6AvkuKMeeFlfrzmz9p0BRH/rEoPTArAmmEGTpSHHwMlrf5xtaDDfmuVZn6JofgwXEHr
	52ZXE1biqDmk/vZuZ9nJ5Vlu+tytGWlX2CLnnE1Pe/YA6OP83sO0Q/hPPxJb5XoG0o2mQwc
	B8lyH5TvjAoNkJpV+lZKA5AW1TZXrSMQ+7Nek1Tj4RvtHtGNAC8V3BSnTIdAV8o2vikxdyG
	RXVEtF/TRE34Rgq+YO6kwP2637U89wAZG3sNIEKGm0adcQ6zEoQzfV/h3JLLa1t8Yoz2Bgo
	Cz/QLFQmMRAlKO5zRQ8IPZ7MzltUn9D+ZE1TPjeUGna9uDghLSJRADpKQ7YJQahNGkcteyI
	ABzSQU8GYDdYkpTcPe6OTmQqQjcs3PDRq+tQZzrWjdzf32lPy5J+xHbVVupo8BxOKiNnnOQ
	yHFUjeLyhgQFrU2CjW45sQ9aNVM8adLm4FjWc/O7pm2R1wIncSe8QoBtdbAgqZjcVOVeC0R
	xs5hNLgX2xvEmbV/MA/IEpIZW
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On 2024/10/21 02:02, Eric Biggers wrote:

> From: Eric Biggers <ebiggers@google.com>
>
> Commit ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment
> operations") changed crc32c_mips_le_hw() to use the instructions that
> use the "regular" CRC32 polynomial instead of the Castagnoli polynomial.
> Therefore it can't be computing CRC32C values correctly anymore.
>
> I haven't been successful in running a MIPS kernel in QEMU, but based on
> code review this is the fix that is needed.
>
> Fixes: ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment operations")
> Cc: Guan Wentao <guanwentao@uniontech.com>
> Cc: WangYuli <wangyuli@uniontech.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> This is a regression in 6.12, so it should be fixed in a 6.12-rc.
>
>   arch/mips/crypto/crc32-mips.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
> index a7a1d43a1b2ca..90eacf00cfc31 100644
> --- a/arch/mips/crypto/crc32-mips.c
> +++ b/arch/mips/crypto/crc32-mips.c
> @@ -121,24 +121,24 @@ static u32 crc32c_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
>   
>   	if (IS_ENABLED(CONFIG_64BIT)) {
>   		for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
>   			u64 value = get_unaligned_le64(p);
>   
> -			CRC32(crc, value, d);
> +			CRC32C(crc, value, d);
>   		}
>   
>   		if (len & sizeof(u32)) {
>   			u32 value = get_unaligned_le32(p);
>   
> -			CRC32(crc, value, w);
> +			CRC32C(crc, value, w);
>   			p += sizeof(u32);
>   		}
>   	} else {
>   		for (; len >= sizeof(u32); len -= sizeof(u32)) {
>   			u32 value = get_unaligned_le32(p);
>   
> -			CRC32(crc, value, w);
> +			CRC32C(crc, value, w);
>   			p += sizeof(u32);
>   		}
>   	}
>   
>   	if (len & sizeof(u16)) {
>
> base-commit: 7fa4be6d6752512278c4cbf2d2745568626e7369

Ah...I apologize for the oversight that introduced this bug...And it's 
indeed a necessary fix.
Thanks,

Acked-by: WangYuli <wangyuli@uniontech.com>
-- 
WangYuli

