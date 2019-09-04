Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0E0A8159
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 13:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfIDLq6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 07:46:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45791 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfIDLq6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 07:46:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id l1so19255593lji.12
        for <linux-mips@vger.kernel.org>; Wed, 04 Sep 2019 04:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=anhS1dT8Khzjsj1S9LZyMCozECKYQ0s+N4eL9s1N5B4=;
        b=Xu7huIrWossEWfgJM30hnPsvuQFejF+v6VPP0VwDTmzEJdIjyaOs6NCjxeVWpjZsru
         566aYYLGBbjfRsb8M1O5+IA5h+OhpjsuZFMAiLVEzjy7qyjETJO7U93UAC8BGJ1CfqH1
         3pBWEm3j9k2baujh/9zS28M9Btla0PmhiVKmOeNh8vLDMJN42c+xBLn1+FMta+uH+n5m
         8Mvqb0QwJP1lav6wpxsQoi1oB8DTNB/7px6i2iisg6Jbc3JuBJTC5bgppqnwwhBdJopf
         KuSjvByYATm7Q3CBTEUBhJ+PgE8fbB2ZCWKF0JsuJqjZ8vqSim2j19XBwjGsUzvpOytd
         qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=anhS1dT8Khzjsj1S9LZyMCozECKYQ0s+N4eL9s1N5B4=;
        b=jsbibJdAVQubVrPzAI4+dUdvmskRZFNF/ILPRwCrCiUt8m0bRA/gs03heTUQsIQE27
         1DiBRC+ecuUEd4Y9vu9PnUFkmr9NvQ7+esqnFSL7kOWCP3hT4R0xWLFioJFhMNxu5xGA
         cp6yYbNK1yhogiv+nR7GelvOcPpUiOFB7cDwbOvckC88U4JdfSpBcpLnAQmU8NFzi4o6
         2RWT9LuldLvYgp/czONFugRITddU/bOrHTaJnld010C2/22joycIoWFJYf525unrHjfT
         We/FrdJJYsg27uTyrBXl0zFuaAygLVIp3lGYJa3gogp6F61eUwi9PhhnwTAc+nW2Q+dj
         olcA==
X-Gm-Message-State: APjAAAXyMuG20BH3Ynf71Bpc4uv0O9rkYNIgyw1uFlfZLIjNGPjrGeox
        npRfBlw8siNAOX5moINGFwosCF9A8YJ92w==
X-Google-Smtp-Source: APXvYqwaWxtuQz1gEQRLu/KtxjGHWAWV2lFg0k6obrXmQXgCX96iURPWQwPU3/mZpx9xzBupt1OKyg==
X-Received: by 2002:a2e:95cd:: with SMTP id y13mr1171913ljh.188.1567597616738;
        Wed, 04 Sep 2019 04:46:56 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:461a:d9ce:6456:1196:2b4:13b6])
        by smtp.gmail.com with ESMTPSA id a11sm3439989lfi.60.2019.09.04.04.46.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 04:46:55 -0700 (PDT)
Subject: Re: [PATCH 038/120] MIPS: PS2: ROM: Read data for a given ROM file
 name
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <69a1b78886392bca426ac6f521197af06d768042.1567326213.git.noring@nocrew.org>
 <9a699dfb-b597-f674-5fd3-cef19b9db15b@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4da72bee-5641-04d0-e74a-ae216874ad4a@cogentembedded.com>
Date:   Wed, 4 Sep 2019 14:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9a699dfb-b597-f674-5fd3-cef19b9db15b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 09/02/2019 12:05 PM, Sergei Shtylyov wrote:

>> Reading ROM files is trivial since they are permanently available in
>> memory. Having rom_read_file() is a convenient when for example
>> resolving the machine region in subsequent changes.
>>
>> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> [...]
>> index 12a57f24bd63..840d37a199d8 100644
>> --- a/arch/mips/ps2/rom.c
>> +++ b/arch/mips/ps2/rom.c
>> @@ -224,6 +224,39 @@ struct rom_file rom_first_file(const struct rom_dir dir)
>>   }
>>   EXPORT_SYMBOL_GPL(rom_first_file);
>>   +/**
>> + * rom_read_file - read ROM file data
>> + * @dir: directory to read the file from
>> + * @name: file name to read
>> + * @buffer: pointer to buffer to store data that is read
>> + * @size: size in bytes to read
>> + * @offset: offset in bytes to start reading
>> + *
>> + * Context: any
>> + * Return: on successful completion, a nonnegative integer indicating the
>> + *     number of bytes actually read; otherwise, a negative error number
>> + */
>> +ssize_t rom_read_file(const struct rom_dir dir,
>> +    const char *name, void *buffer, size_t size, loff_t offset)
>> +{
>> +    struct rom_file file;
>> +
>> +    rom_find_files(file, dir, name)
>> +        if (offset < file.size) {
>> +            const u8 *b = file.data;
>> +            size_t remaining = file.size - offset;
>> +            size_t n = min(size, remaining);
>> +
>> +            memcpy(buffer, &b[offset], n);
>> +
>> +            return n;
>> +        } else
> 
>    The *else* branch also needs {} if the *if* branch has 'emn, according to Documentation/process/coding-style.rst.

   Just realized that we don't need *else* after *return*...

>> +            return 0;
>> +
>> +    return -ENOENT;
>> +}
>> +EXPORT_SYMBOL_GPL(rom_read_file);
>> +
>>   /**
>>    * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
>>    * @rom: ROM to search in

MBR, Sergei
