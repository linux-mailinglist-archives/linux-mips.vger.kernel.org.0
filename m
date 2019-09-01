Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41240A4CA5
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbfIAXEs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:04:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46830 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbfIAXEs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:04:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so10762304wrt.13
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hcoOY6xQWFYwBiG2CO/28/H7/4NHSaie/khrBYy9GYc=;
        b=aHcoGp3Ekc6Op85OW1MJ2FjZP5kMwrK1qDagOtE38g04pkp5HTKGijY5nn38sv5Gd4
         9uMPx/ah56Nn1LKZE0Cad2Ilb58VJ0phCf0TT8wZZ9S3P0vJm94ssNqRbbGgMnVEvPj0
         hHKDZM518VO61VzJet/whTwIGAbNbk1jfCpKwRbHsTXgyjOsUPLNXOlJpXH58EzeoIbg
         CNrBXuSsXduCwbDcQzAiNbwdHcJ8VAk2soopSL/ySKE3Z97EGX9MJkwwJHx9unaqZhtp
         W45RIw42cCp87SF1WShcRfN53pp3a8AXdb9C6A0w9ZWWZzP188FNKjWpdimyUMMordmA
         yq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hcoOY6xQWFYwBiG2CO/28/H7/4NHSaie/khrBYy9GYc=;
        b=c3faiys9WlwNzDIBIKLnNTKTf5jMPjC02Rg+C3iOCTmFHe4ux5BA3cmks7bJogvaWa
         SHDAcOtBBKp53G9JR4Mu9dsqtaRt7Ul8R5jeUm4G3vzkk/0Hv6Ibh8TnA0P1G/BNYIbi
         Yb/B03LwUSXz+HjFmXLwFP/rFtLYogBxoK98NeLfXa2yB1fXBa1NviG7XC8WRL+w0Z0K
         AS+sw/Bwlra0ho6gv6d84e3sXzQ2WOCiif+q/WtHUudB2GhKKwUXxVFLPetN4E/ZMEbv
         yRloWqgkmuTvLpvxk9mZbedy801SEGBWtTxeifSVoZhNmZjvhR77ELxM/7mDv4Rp1iuN
         OVHw==
X-Gm-Message-State: APjAAAXV25k0wyY280tPhvg4VyqxbDXbUfX/9misSnHXhBIiL31R55hN
        symrhAUQ1HH3MGQiQf0jHm7ap8MJ
X-Google-Smtp-Source: APXvYqziIDgKVPBbw34SqMeMujI1118LLLymsAHbo9yK3C7fDmnTJCOPhG8yyd2CJQkSArl4TXx82w==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr26250886wrq.72.1567379086015;
        Sun, 01 Sep 2019 16:04:46 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id f197sm27108349wme.22.2019.09.01.16.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:04:45 -0700 (PDT)
Subject: Re: [PATCH 020/120] MIPS: R5900: Define CP0.Config register fields
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <e7bb27bb8ff03271ee0da7f94fbd41a68bd404ca.1567326213.git.noring@nocrew.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a6b89b72-6bcb-604d-ea8a-99bdc224f975@amsat.org>
Date:   Mon, 2 Sep 2019 01:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e7bb27bb8ff03271ee0da7f94fbd41a68bd404ca.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/1/19 5:43 PM, Fredrik Noring wrote:
> The following CP0.Config fields are specific to the R5900[1]:
> 
> 	Field | Bit | Type | Description
> 	------+-----+------+-----------------------------
> 	  DIE |  18 |   RW | Enable double issue
> 	  ICE |  17 |   RW | Enable the instruction cache
> 	  DCE |  16 |   RW | Enable the data cache
> 	  BE  |  15 |   RO | Enable big-endian
> 	  NBE |  13 |   RW | Enable nonblocking load
> 	  BPE |  12 |   RW | Enable branch prediction
> 	------+-----+------+-----------------------------
> 
> References:
> 
> [1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
>     Toshiba Corporation, p. 4-23, https://wiki.qemu.org/File:C790.pdf
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  arch/mips/include/asm/mipsregs.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index ec22406c800f..a3b3ee011539 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -511,6 +511,14 @@
>  #define R5K_CONF_SE		(_ULCAST_(1) << 12)
>  #define R5K_CONF_SS		(_ULCAST_(3) << 20)
>  
> +/* Bits specific to the R5900.	*/
> +#define R5900_CONF_BPE		(_ULCAST_(1) << 12)	/* Enable branch prediction. */
> +#define R5900_CONF_NBE		(_ULCAST_(1) << 13)	/* Enable non-blocking load. */
> +#define R5900_CONF_BE		(_ULCAST_(1) << 15)	/* Enable big-endian (read-only). */
> +#define R5900_CONF_DCE		(_ULCAST_(1) << 16)	/* Enable the data cache. */
> +#define R5900_CONF_ICE		(_ULCAST_(1) << 17)	/* Enable the instruction cache. */
> +#define R5900_CONF_DIE		(_ULCAST_(1) << 18)	/* Enable double issue. */
> +
>  /* Bits specific to the RM7000.	 */
>  #define RM7K_CONF_SE		(_ULCAST_(1) <<	 3)
>  #define RM7K_CONF_TE		(_ULCAST_(1) << 12)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
