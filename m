Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A94A5278
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 11:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730732AbfIBJGA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 05:06:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41684 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbfIBJF7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 05:05:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id m24so12139140ljg.8
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2019 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=xJet210slRrDsHfH5YZFRI+dvRy0H7DfsDp5vKpJNzw=;
        b=RL4Vd4LsxHaRT9M7Id9PiKeSprXF4TKxcKMRVduVuA4+0FzRK5tRqPzC/AWUN51fCG
         X3n4djdQX3FxOEycidGdVJahoGQOuXgHAjVLaSqO3lLlFidUNDJa6D9vKLWrgf6vG7q2
         6NWSBH20zdKxr8b3SuoZda8NtKpYcLQxAlTk4DTmxZwFFBm80u9MkKnwX2bVmLCBYSqF
         t8nTmubkKDHEYIZUjvc7LgD/eNYcGuAl+f35NanOMtTOJm+5tCL2UTqatOFFf5Pt5w8Y
         yjgHxYpaASZ0Q7GMsT46ZhREBKenxQvolgpj2CfOYj3ucYz2+fc0Xq0Ea+w84EQiuUgd
         PZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xJet210slRrDsHfH5YZFRI+dvRy0H7DfsDp5vKpJNzw=;
        b=alU0BcgtJg2ho9zkbaMl/ppvLpAeAqN78ghPTGj7m6DFxDJYJmc3s/T5Xxm5ZrLO20
         RovPRI1mBkLsT48zfDEy6VVpsOOOlWkUtnA629t2N4Leu/OSF80jbbcs7VwaQp/CUCWc
         sxXYaHGBPbM5jGFewMYZZqNxK57Vo1RSVCyWYVAHUaU3NN8P2doWtfUCcAsCoOUE7YC2
         AcdAEySiEfAE0OaCcb+trUolFKD2cJddFhLzv9k2Rzvs/hgxz0041LHoD5FUOLxbK/JG
         3wk5Va4n5YJcolUYST5ekLJSsluQRlcAARHHdR9q18Naea24jvMNxEoXpyyg4PreFZHv
         zZGw==
X-Gm-Message-State: APjAAAWhz5fM2gtrDoh18kc6pe5P6lxjfI3GbB/quKL+fomC866THqOX
        /x68xLJpifB6v3j0nlM0t7mszw+Kze7clQ==
X-Google-Smtp-Source: APXvYqzWs+c5N2Gmr9Y6G2XIch7oOYnVtrN3Y2L59ZkN7PJu3fssExRyMM+vU8VrUT/K7ne+HTRUsw==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr16133127lji.167.1567415157575;
        Mon, 02 Sep 2019 02:05:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8de:1913:38a5:50eb:7e9f:dca9? ([2a00:1fa0:8de:1913:38a5:50eb:7e9f:dca9])
        by smtp.gmail.com with ESMTPSA id 27sm2236347ljv.21.2019.09.02.02.05.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 02:05:56 -0700 (PDT)
Subject: Re: [PATCH 038/120] MIPS: PS2: ROM: Read data for a given ROM file
 name
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <69a1b78886392bca426ac6f521197af06d768042.1567326213.git.noring@nocrew.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9a699dfb-b597-f674-5fd3-cef19b9db15b@cogentembedded.com>
Date:   Mon, 2 Sep 2019 12:05:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <69a1b78886392bca426ac6f521197af06d768042.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 01.09.2019 18:50, Fredrik Noring wrote:

> Reading ROM files is trivial since they are permanently available in
> memory. Having rom_read_file() is a convenient when for example
> resolving the machine region in subsequent changes.
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
[...]
> index 12a57f24bd63..840d37a199d8 100644
> --- a/arch/mips/ps2/rom.c
> +++ b/arch/mips/ps2/rom.c
> @@ -224,6 +224,39 @@ struct rom_file rom_first_file(const struct rom_dir dir)
>   }
>   EXPORT_SYMBOL_GPL(rom_first_file);
>   
> +/**
> + * rom_read_file - read ROM file data
> + * @dir: directory to read the file from
> + * @name: file name to read
> + * @buffer: pointer to buffer to store data that is read
> + * @size: size in bytes to read
> + * @offset: offset in bytes to start reading
> + *
> + * Context: any
> + * Return: on successful completion, a nonnegative integer indicating the
> + * 	number of bytes actually read; otherwise, a negative error number
> + */
> +ssize_t rom_read_file(const struct rom_dir dir,
> +	const char *name, void *buffer, size_t size, loff_t offset)
> +{
> +	struct rom_file file;
> +
> +	rom_find_files(file, dir, name)
> +		if (offset < file.size) {
> +			const u8 *b = file.data;
> +			size_t remaining = file.size - offset;
> +			size_t n = min(size, remaining);
> +
> +			memcpy(buffer, &b[offset], n);
> +
> +			return n;
> +		} else

    The *else* branch also needs {} if the *if* branch has 'emn, according to 
Documentation/process/coding-style.rst.

> +			return 0;
> +
> +	return -ENOENT;
> +}
> +EXPORT_SYMBOL_GPL(rom_read_file);
> +
>   /**
>    * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
>    * @rom: ROM to search in

MBR, Sergei
