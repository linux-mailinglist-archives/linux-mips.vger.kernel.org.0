Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF111A1B8C
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 07:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgDHFfn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 01:35:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48396 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgDHFfn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 01:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586324141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKKitWhcmQp3vV4NVp+aFS/cFmyiwETlBaGYg7qvVcg=;
        b=XzGnu+XWhZjB2Lm5VblXozfWltWalCsetnG+844K9JhC9jcj+WPBm8E2BSX5sBBAtOu/48
        HTra9/datBSENCx877IifhljNFHl2gUHTRDUQf37xgdbZOvYRVlRiO0H92SGTsEnCbJeV7
        yebMvNtg4WlSGY9EvMWx71tWv/lE6RY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-QBV69SCmO36xwGCr51uxPw-1; Wed, 08 Apr 2020 01:35:38 -0400
X-MC-Unique: QBV69SCmO36xwGCr51uxPw-1
Received: by mail-wm1-f69.google.com with SMTP id f8so1824026wmh.4
        for <linux-mips@vger.kernel.org>; Tue, 07 Apr 2020 22:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DKKitWhcmQp3vV4NVp+aFS/cFmyiwETlBaGYg7qvVcg=;
        b=SRmib7yoreAOUKRlmvPFsx89squwv96TXhOhFeFsbqwvDV3mlPHZHYmMMfkq+sq6Yi
         ZYY4ddSviV4AopL/S10n4oU1I4jhdviDOSMNCtVoUd90Ields3pOp4VlH4STGRBS4yuN
         Wh3jAGiy8Gep9BTSutPsbvuVkJfphz75Hbi5LdtffdjboRIFQ5WgL89MAjJJNVC0Sqy8
         yZC6GR5siSRff4lYRX12n1B1jOBQnQ/hYj47X/hIN+giyQ/Zhtqbb3birmERkTSozktT
         Zi6y87b3H1Cb5PqnXUzX/r1jVTQY3ageIzrNoUGnzZtJvG+KeqG5RniJk5jaXv12SJIO
         zhWQ==
X-Gm-Message-State: AGi0PuZq5mLvqylLDWqrKvgpQwFIAeKNqMuUxbVsGIZqMQ56Rs+zeqiF
        3zWv2r3V41UnA/WI1EjcIy0O6wCUViuGkWUjsS/DFgMioTYoHiuUaWA20F7dzmlHxgjsyjIDBN+
        rcqcjb6n0OXwS3a8PTGFSAA==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr5925790wrv.195.1586324137165;
        Tue, 07 Apr 2020 22:35:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKVQ6jZnquj60J3lHFYTbd2lZIBqpDJo2lkuyyEwCh61W49kQbylHv8LwYeofyA5MUiATbDSA==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr5925770wrv.195.1586324136872;
        Tue, 07 Apr 2020 22:35:36 -0700 (PDT)
Received: from x1.bristot.me ([87.19.200.153])
        by smtp.gmail.com with ESMTPSA id a12sm5179399wmj.22.2020.04.07.22.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 22:35:36 -0700 (PDT)
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        John Mathew <john.mathew@unikie.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        tsbogend@alpha.franken.de, lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
 <20200401103520.GA20713@hirez.programming.kicks-ass.net>
 <9614b346-a848-3e01-eea7-6237b759dad6@redhat.com>
 <20200407134028.44d0d16a@lwn.net>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <20358dfa-4216-9e84-79a6-b34accbc4280@redhat.com>
Date:   Wed, 8 Apr 2020 07:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407134028.44d0d16a@lwn.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/7/20 9:40 PM, Jonathan Corbet wrote:
> On Wed, 1 Apr 2020 13:47:04 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>> And that is a prime example of why I hates RST, it pretty much mandates
>>> you view this with something other than a text editor.  
>> The good thing about the dot format is that we can convert it to many other
>> formats, including text:
>>
>> [bristot@x1 ~]$ cat sched_transition.dot | graph-easy 
>>
>>                        *
>>
>>                        |
>>                        | task
>>                        | forks
>>                        v
>>                      +------------------------------------+
>>                      |              TASK_NEW              |
>>                      |           (Ready to run)           |
>>                      +------------------------------------+
>>                        |
>>                        |
>>                        v
>> + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+
>> '                                     int                                            '
>> '                                                                                    '
>> '                    +------------------------------------+                          '
>> '                    |            TASK_RUNNING            |                          '
>> '   +--------------> |           (Ready to run)           | <--+                     '
>> '   |                +------------------------------------+    |                     '
>> '   |                  |                                       |                     '
>> '   |                  | schedule() calls context_switch()     | task is pre-empted  '
>> '   |                  v                                       |                     '
>> '   |                +------------------------------------+    |                     '
>> '   |                |            TASK_RUNNING            |    |                     '
>> '   |                |             (Running)              | ---+                     '
>> '   | event occurred +------------------------------------+                          '
>> '   |                  |                                                             '
>> '   |                  |                                      - - - - - - - - - - - -+
>> '   |                  |                                    '
>> '   |                  | task needs to wait for event       '
>> '   |                  v                                    '
>> '   |                +------------------------------------+ '
>> '   |                |         TASK_INTERRUPTIBLE         | '
>> '   |                |        TASK_UNINTERRUPTIBLE        | '
>> '   +--------------- |           TASK_WAKEKILL            | '
>> '                    +------------------------------------+ '
>> '                                                           '
>> + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
>>                        |
>>                        | task exits via do_exit()
>>                        v
>>                      +------------------------------------+
>>                      |             TASK_DEAD              |
>>                      |            EXIT_ZOMBIE             |
>>                      +------------------------------------+
>>
>>
>> Is there a way to also add this representation, while hiding it
>> when using a graphical reader?
> Better, honestly, to just put the ascii art into the doc as a literal
> block.  I don't see any real reason to embed Dot stuff unless there's
> really no alternative.

I agree.

I think that their idea was focused on a media that could translate the
"source-code in .dot" into a graphical representation, which is good. But that
is not the case for this file and its audience.

But, maybe, it would be nice to have the .dot somewhere (not in the document, I
agree) as a "source code" for future updates.

-- Daniel

